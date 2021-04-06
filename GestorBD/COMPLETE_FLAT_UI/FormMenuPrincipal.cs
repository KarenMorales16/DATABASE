using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
namespace COMPLETE_FLAT_UI
{
    public partial class FormMenuPrincipal : Form
    {
        public MySqlConnection conexion;
        public string TABLE;
        string inserto;
        int[] tipodato;
        string BD, TAB;
        string oper, valu;
        string campo;
        ArrayList cmp = new ArrayList();
        ArrayList datos = new ArrayList();
        DataTable dt = new DataTable();
        int rows;
        string BASEDEDATOSUSADA;
        int i;
        public FormMenuPrincipal()
        {
            InitializeComponent();
            this.SetStyle(ControlStyles.ResizeRedraw, true);

        }

        int lx, ly;
        int sw, sh;
        //METODO PARA ARRASTRAR EL FORMULARIO---------------------------------------------------------------------
        [DllImport("user32.DLL", EntryPoint = "ReleaseCapture")]
        private extern static void ReleaseCapture();
        [DllImport("user32.DLL", EntryPoint = "SendMessage")]
        private extern static void SendMessage(System.IntPtr hWnd, int wMsg, int wParam, int lParam);

        private void BarraTitulo_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }
        //METODOS PARA CERRAR,MAXIMIZAR, MINIMIZAR FORMULARIO------------------------------------------------------

        private void btnMaximizar_Click(object sender, EventArgs e)
        {
            lx = this.Location.X;
            ly = this.Location.Y;
            sw = this.Size.Width;
            sh = this.Size.Height;
            this.Size = Screen.PrimaryScreen.WorkingArea.Size;
            this.Location = Screen.PrimaryScreen.WorkingArea.Location;
            btnMaximizar.Visible = false;
            btnNormal.Visible = true;

        }

        private void btnNormal_Click(object sender, EventArgs e)
        {
            this.Size = new Size(sw, sh);
            this.Location = new Point(lx, ly);
            btnNormal.Visible = false;
            btnMaximizar.Visible = true;
        }

        string instruccion;

        public DataTable VistaTabla(string TABLA)
        {

            instruccion = "SELECT * FROM " + TABLA + ";";
            MySqlDataAdapter adp = new MySqlDataAdapter(instruccion, conexion);
            DataTable COnsulta = new DataTable();
            adp.Fill(COnsulta);
            return COnsulta;
            conexion.Close();

        }

        public DataTable VistaTablawhere(string TABLA, string campo, string oper, string valu)
        {
            //select* from clientes where nombre = 'yuri';
            instruccion = "SELECT * FROM " + TABLA + " WHERE " + campo + " " + oper + "'" + valu + "';";
            MySqlDataAdapter adp = new MySqlDataAdapter(instruccion, conexion);
            DataTable COnsulta = new DataTable();
            adp.Fill(COnsulta);
            return COnsulta;
            conexion.Close();

        }



        private void btnMinimizar_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }

        private void btnCerrar_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("¿Está seguro de cerrar?", "Alerta¡¡", MessageBoxButtons.YesNo) == DialogResult.Yes)
            {
                Application.Exit();
            }
        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("¿Está seguro de cerrar?", "Alerta¡¡", MessageBoxButtons.YesNo) == DialogResult.Yes)
            {
                Application.Exit();
            }
        }

        //METODOS PARA ANIMACION DE MENU SLIDER------------------------------------------------------
        private void btnMenu_Click(object sender, EventArgs e)
        {
            //-------CON EFECTO SLIDE
            if (panelMenu.Width == 230)
            {
                this.tmOcultarMenu.Enabled = true;
            }
            else if (panelMenu.Width == 55)
                this.tmMostrarMenu.Enabled = true;

            //-------SIN EFECTO SLIDE
            //if (panelMenu.Width == 55)
            //{
            //    panelMenu.Width = 230;
            //}
            //else

            //    panelMenu.Width = 55;
        }

        private void tmMostrarMenu_Tick(object sender, EventArgs e)
        {
            if (panelMenu.Width >= 230)
                this.tmMostrarMenu.Enabled = false;
            else
                panelMenu.Width = panelMenu.Width + 35;

        }

        private void tmOcultarMenu_Tick(object sender, EventArgs e)
        {
            if (panelMenu.Width <= 55)
                this.tmOcultarMenu.Enabled = false;
            else
                panelMenu.Width = panelMenu.Width - 35;
        }

        //METODO PARA ABRIR FORM DENTRO DE PANEL-----------------------------------------------------
        private void AbrirFormEnPanel(object formHijo)
        {
            if (this.panelContenedor.Controls.Count > 0)
                this.panelContenedor.Controls.RemoveAt(0);
            Form fh = formHijo as Form;
            fh.TopLevel = false;
            fh.FormBorderStyle = FormBorderStyle.None;
            fh.Dock = DockStyle.Fill;
            this.panelContenedor.Controls.Add(fh);
            this.panelContenedor.Tag = fh;
            fh.Show();
        }


        //METODOS PARA ABRIR OTROS FORMULARIOS Y MOSTRAR FORM DE LOGO Al CERRAR ----------------------------------------------------------
        private void btnListaClientes_Click(object sender, EventArgs e)
        {

        }

        private void btnMembresia_Click(object sender, EventArgs e)
        {

        }
        //METODO PARA HORA Y FECHA ACTUAL ----------------------------------------------------------
        private void tmFechaHora_Tick(object sender, EventArgs e)
        {
            lbFecha.Text = DateTime.Now.ToLongDateString();
            lblHora.Text = DateTime.Now.ToString("HH:mm:ssss");
        }
        //METODO PARA REDIMENCIONAR/CAMBIAR TAMAÑO A FORMULARIO  TIEMPO DE EJECUCION ----------------------------------------------------------
        private int tolerance = 15;
        private const int WM_NCHITTEST = 132;
        private const int HTBOTTOMRIGHT = 17;
        private Rectangle sizeGripRectangle;
        private List<object> nombre;

        protected override void WndProc(ref Message m)
        {
            switch (m.Msg)
            {
                case WM_NCHITTEST:
                    base.WndProc(ref m);
                    var hitPoint = this.PointToClient(new Point(m.LParam.ToInt32() & 0xffff, m.LParam.ToInt32() >> 16));
                    if (sizeGripRectangle.Contains(hitPoint))
                        m.Result = new IntPtr(HTBOTTOMRIGHT);
                    break;
                default:
                    base.WndProc(ref m);
                    break;
            }
        }
        //----------------DIBUJAR RECTANGULO / EXCLUIR ESQUINA PANEL 
        protected override void OnSizeChanged(EventArgs e)
        {
            base.OnSizeChanged(e);
            var region = new Region(new Rectangle(0, 0, this.ClientRectangle.Width, this.ClientRectangle.Height));

            sizeGripRectangle = new Rectangle(this.ClientRectangle.Width - tolerance, this.ClientRectangle.Height - tolerance, tolerance, tolerance);

            region.Exclude(sizeGripRectangle);
            this.panel1ContenedorPrincipal.Region = region;
            this.Invalidate();
        }



        private void panelMenu_Paint(object sender, PaintEventArgs e)
        {

        }

        private void button6_Click(object sender, EventArgs e)
        {

        }

        private void PanelConec_Paint(object sender, PaintEventArgs e)
        {

        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            string servidor = SerText.Text;
            string puerto = PuerText.Text;
            string usuario = UsuText.Text;
            string password = PasText.Text;
            string datos = "";

            //string cadenaconexion = "server=" + servidor + ";port=" + puerto + ";user id=" + usuario + "; password=" + password + "; database=mysql;";
            conexion = new MySqlConnection("server=localhost;port=3306;port=3306;user id=root;password=16210977;");

            try
            {
                conexion.Open();
                PanelConec.Visible = false;
                INSERTAR.Visible = true;
                conexion.Close();





            }
            catch (MySqlException ex)
            {
                MessageBox.Show("ERROR DE CONEXION");


            }
        }

        private void SerText_TextChanged(object sender, EventArgs e)
        {
            Lservidor.Visible = false;
        }

        private void labelpuert_Click(object sender, EventArgs e)
        {

        }

        private void PuerText_TextChanged(object sender, EventArgs e)
        {
            labelpuert.Visible = false;
        }

        private void UsuText_TextChanged(object sender, EventArgs e)
        {
            labelusuario.Visible = false;
        }

        private void PasText_TextChanged(object sender, EventArgs e)
        {
            labelcont.Visible = false;
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {

        }

       

        private void btnSalir_Click_1(object sender, EventArgs e)
        {
            if (MessageBox.Show("¿Está seguro de cerrar?", "Alerta¡¡", MessageBoxButtons.YesNo) == DialogResult.Yes)
            {
                Application.Exit();
            }
        }

        private void pictureBox5_Click(object sender, EventArgs e)
        {



        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (comboBox1.SelectedItem == "1")
            {
                try
                {
                    Registro.Visible = true; Tipo.Visible = true;
                    NR1.Visible = true; TR1.Visible = true;
                    NR2.Visible = false; TR2.Visible = false;
                    NR3.Visible = false; TR3.Visible = false;
                    NR4.Visible = false; TR4.Visible = false;
                    NR5.Visible = false; TR5.Visible = false;
                }
                catch (Exception ex) { MessageBox.Show("Ingrese datos"); }
            }
            else if (comboBox1.SelectedItem == "2")
            {

                try
                {
                    Registro.Visible = true; Tipo.Visible = true;
                    NR1.Visible = true; TR1.Visible = true;
                    NR2.Visible = true; TR2.Visible = true;
                    NR3.Visible = false; TR3.Visible = false;
                    NR4.Visible = false; TR4.Visible = false;
                    NR5.Visible = false; TR5.Visible = false;
                }
                catch (Exception ex) { MessageBox.Show("Ingrese datos"); }

            }
            else if (comboBox1.SelectedItem == "3")
            {
                try
                {
                    Registro.Visible = true; Tipo.Visible = true;
                    NR1.Visible = true; TR1.Visible = true;
                    NR2.Visible = true; TR2.Visible = true;
                    NR3.Visible = true; TR3.Visible = true;
                    NR4.Visible = false; TR4.Visible = false;
                    NR5.Visible = false; TR5.Visible = false;
                }
                catch (Exception ex) { MessageBox.Show("Ingrese datos"); }

            }
            else if (comboBox1.SelectedItem == "4")
            {
                try
                {
                    Registro.Visible = true; Tipo.Visible = true;
                    NR1.Visible = true; TR1.Visible = true;
                    NR2.Visible = true; TR2.Visible = true;
                    NR3.Visible = true; TR3.Visible = true;
                    NR4.Visible = true; TR4.Visible = true;
                    NR5.Visible = false; TR5.Visible = false;
                }
                catch (Exception ex) { MessageBox.Show("Ingrese datos"); }

            }
            else if (comboBox1.SelectedItem == "5")
            {
                try
                {
                    Registro.Visible = true; Tipo.Visible = true;
                    NR1.Visible = true; TR1.Visible = true;
                    NR2.Visible = true; TR2.Visible = true;
                    NR3.Visible = true; TR3.Visible = true;
                    NR4.Visible = true; TR4.Visible = true;
                    NR5.Visible = true; TR5.Visible = true;
                }
                catch (Exception ex) { MessageBox.Show("Ingrese datos"); }
            }

        }

        private void bunifuImageButton1_Click(object sender, EventArgs e)
        {


            try
            { string BD = "CREATE DATABASE " + TXTCBD.Text;

                conexion.Open();
                MySqlCommand cmd = new MySqlCommand(BD, conexion);

                cmd.ExecuteNonQuery();
               
                MessageBox.Show("BASE DE DATOS  " + TXTCBD.Text + " CREADA CON EXITO!!");
                conexion.Close();
                ARBOL();
            }
            catch (Exception ex)
            {


                MessageBox.Show(ex.Message,
                    "ERROR AL CREAR LA BASE DE DATOS",
                    MessageBoxButtons.OK, MessageBoxIcon.Error);

            }
            finally
            {
                conexion.Close();
            }
        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void bunifuImageButton2_Click(object sender, EventArgs e)
        {
            //USARBaseDatos(DATABASES);
        }

        private void bunifuImageButton5_Click(object sender, EventArgs e)
        {

            
        }

        private void bunifuImageButton6_Click(object sender, EventArgs e)
        {




        }

        private void bunifuImageButton3_Click(object sender, EventArgs e)
        {

            
        }

        private void bunifuImageButton4_Click(object sender, EventArgs e)
        {



            try
            {
                string BD = " DROP DATABASE  " + DATABASES1.SelectedItem.ToString() + ";";

                conexion.Open();
                MySqlCommand cmd = new MySqlCommand(BD, conexion);
                cmd.ExecuteNonQuery();
                MessageBox.Show("BASE DE DATOS " + DATABASES1.SelectedItem.ToString() + " ELIMINADA CON EXITO!");
                DATABASES1.SelectedIndex = -1;
                DATABASES.SelectedIndex = -1;
                conexion.Close();
                ARBOL();
            }
            catch (Exception ex)
            {
                conexion.Close();

                MessageBox.Show(ex.Message,
                    "EROR!! AL ELIMINAR LA BASE DE DATOS",
                    MessageBoxButtons.OK, MessageBoxIcon.Error);

            }
        }

        private void bunifuImageButton7_Click(object sender, EventArgs e)
        {

            try
            {
                conexion.Open();
                string BD1 = " DROP TABLE " + DATABASES3.SelectedItem.ToString() + ";";
                MySqlCommand cmd1 = new MySqlCommand(BD1, conexion);
                cmd1.ExecuteNonQuery();
                MessageBox.Show("TABLA " + DATABASES3.SelectedItem.ToString() + " ELIMINADA CON EXITO!");
                DATABASES3.SelectedIndex = -1;

                conexion.Close();
            }
            catch (Exception ex)
            {

                conexion.Close();
                MessageBox.Show(ex.Message,
                    "EROR!! AL ELIMINAR LA TABLA",
                    MessageBoxButtons.OK, MessageBoxIcon.Error);

            }
        }

        private void DATABASES1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void DATABASES_Click(object sender, EventArgs e)
        {
            MostrarBaseDatos(DATABASES);
        }
        private void DATABASES1_Click(object sender, EventArgs e)
        {
            MostrarBaseDatos(DATABASES1);
        }

        private void DATABASES3_Click(object sender, EventArgs e)
        {
            MostrarTABLAS(DATABASES3, BASEDEDATOSUSADA);
        }

        private void DATABASES3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void DATABASES1_SelectedIndexChanged_1(object sender, EventArgs e)
        {

        }

        private void tabPage3_Click(object sender, EventArgs e)
        {

        }

        private void comboBox3_Click(object sender, EventArgs e)
        {

        }

     
        private void USARTBL_Click(object sender, EventArgs e)
        {
            MostrarTABLAS(USARTBL, BASEDEDATOSUSADA);
        }

        private void dataGridView1_CellContentClick_1(object sender, DataGridViewCellEventArgs e)
        {

        }
        public void DATOSCAMPOS(ComboBox TBL, String BASEDEDATOSUSADA, ComboBox Cps)
        {

            try
            {


                String m = " SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name = '" + TBL.SelectedItem.ToString() + "' AND table_schema = '" + BASEDEDATOSUSADA + "';";
                Cps.Items.Clear();
                conexion.Open();
                MySqlCommand comando = new MySqlCommand(m, conexion);
                MySqlDataReader sdbdr = comando.ExecuteReader();
                Cps.Items.Add("TODO");
                while (sdbdr.Read() == true)
                {
                    Cps.Items.Add(sdbdr[0]);

                }
                conexion.Close();

            }
            catch (Exception ex)

            {
                MessageBox.Show(ex.ToString());
                Campos.Items.Clear();
            }
        }
        public void ELIMINARCAMPOS(ComboBox TBL, ComboBox BASEDTOS, ComboBox Cps)
        {


        }
        public void estructuratatabla(string Tablas, string BASEDDATOS)
        {


            try
            {


                String m = " SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name = '" + Tablas + "' AND table_schema = '" + BASEDDATOS + "';";

                conexion.Open();
                MySqlCommand comando = new MySqlCommand(m, conexion);
                MySqlDataReader sdbdr = comando.ExecuteReader();
                dataGridView1.Columns.Clear();
                cmp.Clear();
                while (sdbdr.Read() == true)
                {
                    
                    cmp.Add(sdbdr[0].ToString());
                    dataGridView1.Columns.Add(sdbdr[0].ToString(), sdbdr[0].ToString());

                }
                conexion.Close();

            }
            catch (Exception ex)

            {
                MessageBox.Show(ex.ToString());

            }
        }

        private void bunifuImageButton8_Click(object sender, EventArgs e)
        {
           
        }

        private void TXTCBD_TextChanged(object sender, EventArgs e)
        {
            
        }

      

        private void BASEDDATOS_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void tabPage2_Click(object sender, EventArgs e)
        {

        }

    
        private void USARBD_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        public void MostrarTABLAS(ComboBox USARTB, String BD)
        {
            try
            {
                conexion.Open();
                USARTB.Items.Clear();
                String Tablesm = "SHOW FULL TABLES FROM  " + BD;
                MySqlCommand cmdm = new MySqlCommand(Tablesm, conexion);

                MySqlDataReader drm = cmdm.ExecuteReader();
                while (drm.Read() == true)
                {
                    USARTB.Items.Add(drm[0]);

                }
                conexion.Close();
            }
            catch (Exception)
            {
                USARTB.Items.Clear();
            }
        }
        public void MostrarBaseDatos(ComboBox COMBO)
        {
            try
            {
                conexion.Open();
                COMBO.Items.Clear();
                MySqlCommand sdb = new MySqlCommand("SHOW DATABASES", conexion);
                MySqlDataReader sdbdr = sdb.ExecuteReader();
                while (sdbdr.Read() == true)
                {
                    COMBO.Items.Add(sdbdr[0]);

                }
                conexion.Close();
            }
            catch (Exception ex)
            {
                conexion.Close();
            }

        }

        private void USARTBL_SelectedIndexChanged(object sender, EventArgs e)
        {
            MostrarTABLAS(USARTBL, BASEDEDATOSUSADA);
        }

        private void Tablas_Click(object sender, EventArgs e)
        {
            MostrarTABLAS(Tablas, BASEDEDATOSUSADA);
        }

        private void Campos_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Campos.SelectedItem.ToString() != "TODO")
            {
                Condicion.Visible = true;
                valor.Visible = true;
                bunifuCustomLabel12.Visible = true;
            }
            if (Campos.SelectedItem.ToString() == "TODO")
            {
                Condicion.Visible = false;
                valor.Visible = false;
                bunifuCustomLabel12.Visible = false;
            }
        }

        private void Campos_Click(object sender, EventArgs e)
        {

            try
            {


                String m = " SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name = '" + Tablas.SelectedItem.ToString() + "' AND table_schema = '" + BASEDEDATOSUSADA+ "';";
                Campos.Items.Clear();
                conexion.Open();
                MySqlCommand comando = new MySqlCommand(m, conexion);
                MySqlDataReader sdbdr = comando.ExecuteReader();
                Campos.Items.Add("TODO");
                while (sdbdr.Read() == true)
                {
                    Campos.Items.Add(sdbdr[0]);
                    Campos.SelectedIndex = -1;

                }
                conexion.Close();

            }
            catch (Exception ex)

            {
                MessageBox.Show(ex.ToString());
                Campos.Items.Clear();
            }


        }



        private void Insert_Click(object sender, EventArgs e)
        {
            try
            {
            int Total = int.Parse(dataGridView1.ColumnCount.ToString());

            if (Total == 1) { inserto = "?" + cmp[0].ToString(); }
            else if (Total == 2) { inserto = "?" + cmp[0].ToString() + "," + "?" + cmp[1].ToString(); }
            else if (Total == 3) { inserto = "?" + cmp[0].ToString() + "," + "?" + cmp[1].ToString() + "," + "?" + cmp[2].ToString(); }
            else if (Total == 4) { inserto = "?" + cmp[0].ToString() + "," + "?" + cmp[1].ToString() + "," + "?" + cmp[2].ToString() + "," + "?" + cmp[3].ToString(); }
            else if (Total == 5) { inserto = "?" + cmp[0].ToString() + "," + "?" + cmp[1].ToString() + "," + "?" + cmp[2].ToString() + "," + "?" + cmp[3].ToString() + "," + "?" + cmp[4].ToString(); }
            else if (Total == 6) { inserto = "?" + cmp[0].ToString() + "," + "?" + cmp[1].ToString() + "," + "?" + cmp[2].ToString() + "," + "?" + cmp[3].ToString() + "," + "?" + cmp[4].ToString() + "," + "?" + cmp[5].ToString(); }
            else if (Total == 7) { inserto = "?" + cmp[0].ToString() + "," + "?" + cmp[1].ToString() + "," + "?" + cmp[2].ToString() + "," + "?" + cmp[3].ToString() + "," + "?" + cmp[4].ToString() + "," + "?" + cmp[5].ToString() +"," + "?" + cmp[6].ToString(); }
            else if (Total == 8) { inserto = "?" + cmp[0].ToString() + "," + "?" + cmp[1].ToString() + "," + "?" + cmp[2].ToString() + "," + "?" + cmp[3].ToString() + "," + "?" + cmp[4].ToString() + "," + "?" + cmp[5].ToString() + "," + "?" + cmp[6].ToString() +"," + "?" + cmp[7].ToString(); }
            else if (Total == 9) { inserto = "?" + cmp[0].ToString() + "," + "?" + cmp[1].ToString() + "," + "?" + cmp[2].ToString() + "," + "?" + cmp[3].ToString() + "," + "?" + cmp[4].ToString() + "," + "?" + cmp[5].ToString() + "," + "?" + cmp[6].ToString() + "," + "?" + cmp[7].ToString() + "," + "?" + cmp[8].ToString(); }
            else if (Total == 10){ inserto = "?" + cmp[0].ToString() + "," + "?" + cmp[1].ToString() + "," + "?" + cmp[2].ToString() + "," + "?" + cmp[3].ToString() + "," + "?" + cmp[4].ToString() + "," + "?" + cmp[5].ToString() + "," + "?" + cmp[6].ToString() + "," + "?" + cmp[7].ToString() + "," + "?" + cmp[8].ToString() + "," + "?" + cmp[9].ToString(); }

           
            String insertar = "insert into " + USARTBL.SelectedItem.ToString() + " values("+inserto+");";

            MySqlCommand cmd = new MySqlCommand(insertar, conexion);
            

            conexion.Open();
                foreach (DataGridViewRow row in dataGridView1.Rows)
                {

                    cmd.Parameters.Clear();
                    if (Total == 1) { cmd.Parameters.AddWithValue("?" + cmp[0], row.Cells[cmp[0].ToString()].Value); }
                    else if (Total == 2) { cmd.Parameters.AddWithValue("?" + cmp[0], row.Cells[cmp[0].ToString()].Value); cmd.Parameters.AddWithValue("?" + cmp[1], row.Cells[cmp[1].ToString()].Value); }
                    else if (Total == 3) { cmd.Parameters.AddWithValue("?" + cmp[0], row.Cells[cmp[0].ToString()].Value); cmd.Parameters.AddWithValue("?" + cmp[1], row.Cells[cmp[1].ToString()].Value); cmd.Parameters.AddWithValue("?" + cmp[2], row.Cells[cmp[2].ToString()].Value); }
                    else if (Total == 4) { cmd.Parameters.AddWithValue("?" + cmp[0], row.Cells[cmp[0].ToString()].Value); cmd.Parameters.AddWithValue("?" + cmp[1], row.Cells[cmp[1].ToString()].Value); cmd.Parameters.AddWithValue("?" + cmp[2], row.Cells[cmp[2].ToString()].Value); cmd.Parameters.AddWithValue("?" + cmp[3], row.Cells[cmp[3].ToString()].Value); }
                    else if (Total == 5)
                    {
                        cmd.Parameters.AddWithValue("?" + cmp[0], row.Cells[cmp[0].ToString()].Value); cmd.Parameters.AddWithValue("?" + cmp[1], row.Cells[cmp[1].ToString()].Value); cmd.Parameters.AddWithValue("?" + cmp[2], row.Cells[cmp[2].ToString()].Value);
                        cmd.Parameters.AddWithValue("?" + cmp[3], row.Cells[cmp[3].ToString()].Value); cmd.Parameters.AddWithValue("?" + cmp[4], row.Cells[cmp[4].ToString()].Value);
                    }
                    else if (Total == 6)
                    {
                        cmd.Parameters.AddWithValue("?" + cmp[0], row.Cells[cmp[0].ToString()].Value); cmd.Parameters.AddWithValue("?" + cmp[1], row.Cells[cmp[1].ToString()].Value); cmd.Parameters.AddWithValue("?" + cmp[2], row.Cells[cmp[2].ToString()].Value);
                        cmd.Parameters.AddWithValue("?" + cmp[3], row.Cells[cmp[3].ToString()].Value); cmd.Parameters.AddWithValue("?" + cmp[4], row.Cells[cmp[4].ToString()].Value); cmd.Parameters.AddWithValue("?" + cmp[5], row.Cells[cmp[5].ToString()].Value);
                    }
                    else if (Total == 7)
                    {
                        cmd.Parameters.AddWithValue("?" + cmp[0], row.Cells[cmp[0].ToString()].Value); cmd.Parameters.AddWithValue("?" + cmp[1], row.Cells[cmp[1].ToString()].Value); cmd.Parameters.AddWithValue("?" + cmp[2], row.Cells[cmp[2].ToString()].Value);
                        cmd.Parameters.AddWithValue("?" + cmp[3], row.Cells[cmp[3].ToString()].Value); cmd.Parameters.AddWithValue("?" + cmp[4], row.Cells[cmp[4].ToString()].Value); cmd.Parameters.AddWithValue("?" + cmp[5], row.Cells[cmp[5].ToString()].Value);
                        cmd.Parameters.AddWithValue("?" + cmp[6], row.Cells[cmp[6].ToString()].Value);
                    }
                    else if (Total == 8)
                    {
                        cmd.Parameters.AddWithValue("?" + cmp[0], row.Cells[cmp[0].ToString()].Value); cmd.Parameters.AddWithValue("?" + cmp[1], row.Cells[cmp[1].ToString()].Value); cmd.Parameters.AddWithValue("?" + cmp[2], row.Cells[cmp[2].ToString()].Value);
                        cmd.Parameters.AddWithValue("?" + cmp[3], row.Cells[cmp[3].ToString()].Value); cmd.Parameters.AddWithValue("?" + cmp[4], row.Cells[cmp[4].ToString()].Value); cmd.Parameters.AddWithValue("?" + cmp[5], row.Cells[cmp[5].ToString()].Value);
                        cmd.Parameters.AddWithValue("?" + cmp[6], row.Cells[cmp[6].ToString()].Value); cmd.Parameters.AddWithValue("?" + cmp[7], row.Cells[cmp[7].ToString()].Value);
                    }
                    else if (Total == 9)
                    {
                        cmd.Parameters.AddWithValue("?" + cmp[0], row.Cells[cmp[0].ToString()].Value); cmd.Parameters.AddWithValue("?" + cmp[1], row.Cells[cmp[1].ToString()].Value); cmd.Parameters.AddWithValue("?" + cmp[2], row.Cells[cmp[2].ToString()].Value);
                        cmd.Parameters.AddWithValue("?" + cmp[3], row.Cells[cmp[3].ToString()].Value); cmd.Parameters.AddWithValue("?" + cmp[4], row.Cells[cmp[4].ToString()].Value); cmd.Parameters.AddWithValue("?" + cmp[5], row.Cells[cmp[5].ToString()].Value);
                        cmd.Parameters.AddWithValue("?" + cmp[6], row.Cells[cmp[6].ToString()].Value); cmd.Parameters.AddWithValue("?" + cmp[7], row.Cells[cmp[7].ToString()].Value); cmd.Parameters.AddWithValue("?" + cmp[8], row.Cells[cmp[8].ToString()].Value);
                    }
                    else if (Total == 10)
                    {
                        cmd.Parameters.AddWithValue("?" + cmp[0], row.Cells[cmp[0].ToString()].Value); cmd.Parameters.AddWithValue("?" + cmp[1], row.Cells[cmp[1].ToString()].Value); cmd.Parameters.AddWithValue("?" + cmp[2], row.Cells[cmp[2].ToString()].Value);
                        cmd.Parameters.AddWithValue("?" + cmp[3], row.Cells[cmp[3].ToString()].Value); cmd.Parameters.AddWithValue("?" + cmp[4], row.Cells[cmp[4].ToString()].Value); cmd.Parameters.AddWithValue("?" + cmp[5], row.Cells[cmp[5].ToString()].Value);
                        cmd.Parameters.AddWithValue("?" + cmp[6], row.Cells[cmp[6].ToString()].Value); cmd.Parameters.AddWithValue("?" + cmp[7], row.Cells[cmp[7].ToString()].Value); cmd.Parameters.AddWithValue("?" + cmp[8], row.Cells[cmp[8].ToString()].Value);
                        cmd.Parameters.AddWithValue("?" + cmp[9], row.Cells[cmp[9].ToString()].Value);
                    }
                    cmd.ExecuteNonQuery();
             MessageBox.Show("DATOS AGREGADOS CORRECTAMENTE");
                }
            dataGridView1.DataSource = null;
            dataGridView1.Refresh();



            }

            catch (Exception ex)
            {
                MessageBox.Show("LLAVE PRIMARIA DUPLICADA o DATOS AGREGADOS INCORECTAMENTE");
            }
            finally
            {
                conexion.Close();
            }
            
        }

        private void USARTBL_SelectedIndexChanged_1(object sender, EventArgs e)
        {
            try
            {

                estructuratatabla(USARTBL.SelectedItem.ToString(), BASEDEDATOSUSADA);
            }
            catch (Exception EX)
            {
                MessageBox.Show(EX.ToString());

            }
        }

        private void DATABASES_SelectedIndexChanged(object sender, EventArgs e)
        {
            USARBaseDatos(DATABASES);
            BASEDEDATOSUSADA = DATABASES.SelectedItem.ToString();
            BDI.Text = BASEDEDATOSUSADA;
            BDI.Visible = true;
            BDB.Text = BASEDEDATOSUSADA;
            BDB.Visible = true;
            BDM.Text = BASEDEDATOSUSADA;
            BDM.Visible = true;
            BDBO.Text = BASEDEDATOSUSADA;
            BDBO.Visible = true;
        }

        private void tabPage4_Click(object sender, EventArgs e)
        {

        }

        private void TBL_SelectedIndexChanged(object sender, EventArgs e)
        {

        }


        private void TBL_Click(object sender, EventArgs e)
        {
            MostrarTABLAS(TBL, BASEDEDATOSUSADA);
        }



        private void MODIFICAR_Click(object sender, EventArgs e)
        {

        }

        private void modi_Click(object sender, EventArgs e)
        {
            try
            {


                String m = " SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name = '" + TBL.SelectedItem.ToString() + "' AND table_schema = '" + BASEDEDATOSUSADA + "';";
                modi.Items.Clear();
                conexion.Open();
                MySqlCommand comando = new MySqlCommand(m, conexion);
                MySqlDataReader sdbdr = comando.ExecuteReader();
                while (sdbdr.Read() == true)
                {
                    modi.Items.Add(sdbdr[0]);

                }
                conexion.Close();

            }
            catch (Exception ex)

            {
                MessageBox.Show(ex.ToString());
                Campos.Items.Clear();
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            try
            {
                string T = TBL.SelectedItem.ToString();
                string CM = modi.SelectedItem.ToString();
                string VM = vlr.Text;
                string C = Cd.SelectedItem.ToString();
                string VC = cond.Text;
                string VA = VLA.SelectedItem.ToString();
                conexion.Open();
                //UPDATE escuelass SET nombre='IT' WHERE id_escuela='20';
                string UPDATE = " UPDATE " + T + " SET " + CM + "='" + VM + "' WHERE " + VA + C + "'" + VC + "'";

                MySqlCommand cmd = new MySqlCommand(UPDATE, conexion);
                cmd.ExecuteNonQuery();
                TABLAMODIFICAR.DataSource = VistaTabla(TBL.SelectedItem.ToString());
                conexion.Close();
            }
            catch (MySqlException ex)
            {
                MessageBox.Show(ex.ToString());

            }
            finally
            {
                conexion.Close();
            }
        }

        private void VLA_Click(object sender, EventArgs e)
        {
            try
            {


                String m = " SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name = '" + TBL.SelectedItem.ToString() + "' AND table_schema = '" +BASEDEDATOSUSADA + "';";
                VLA.Items.Clear();
                conexion.Open();
                MySqlCommand comando = new MySqlCommand(m, conexion);
                MySqlDataReader sdbdr = comando.ExecuteReader();
                while (sdbdr.Read() == true)
                {
                    VLA.Items.Add(sdbdr[0]);

                }
                conexion.Close();

            }
            catch (Exception ex)

            {
                MessageBox.Show(ex.ToString());
                Campos.Items.Clear();
            }
        }

        private void BD3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        
        private void BORRAR_Click(object sender, EventArgs e)
        {

        }

       

        private void comboBox5_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void TBL3_ClientSizeChanged(object sender, EventArgs e)
        {

        }

        private void TBL3_Click(object sender, EventArgs e)
        {
            MostrarTABLAS(TBL3, BASEDEDATOSUSADA);
        }

        private void comboBox4_Click(object sender, EventArgs e)
        {
            DATOSCAMPOS(TBL3, BASEDEDATOSUSADA, comboBox4);
        }

        private void comboBox4_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (comboBox4.SelectedItem.ToString() != "TODO")
            {
                comboBox3.Visible = true;
                textBox1.Visible = true;
            }
            if (comboBox4.SelectedItem.ToString() == "TODO")
            {
                comboBox3.Visible = false;
                textBox1.Visible = false;
            }
        }

        private void borrarbt_Click(object sender, EventArgs e)
        { string TBL33 = TBL3.SelectedItem.ToString();
            string CPS3 = comboBox4.SelectedItem.ToString();
            string Op3 = comboBox3.Text;
            string VB = textBox1.Text;
            try
            {
                if (comboBox4.SelectedItem.ToString() == "TODO")
                {
                    try
                    {
                        conexion.Open();
                        string DELETE = " truncate table " + TBL33 + " ;";
                        MySqlCommand cmd = new MySqlCommand(DELETE, conexion);
                        cmd.ExecuteNonQuery();
                        MOSTRARBORARDOS.DataSource = VistaTabla(TBL3.SelectedItem.ToString());
                        conexion.Close();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.ToString());
                    }
                    finally { conexion.Close(); }
                }
                else if (comboBox4.SelectedItem.ToString() != "TODO")
                {
                    try
                    {
                        conexion.Open();
                        //DELETE FROM escuelass WHERE id_escuela='20'
                        //DELETE FROM TBL3.TO WHERE ComboBox4. ComboBox3. " '"+textBox1.Text();

                        string DELETES = "DELETE FROM " + TBL33 + " WHERE " + CPS3 + Op3 + "'" + VB + "'";

                        MySqlCommand cmd = new MySqlCommand(DELETES, conexion);
                        cmd.ExecuteNonQuery();
                        MOSTRARBORARDOS.DataSource = VistaTabla(TBL3.SelectedItem.ToString());
                        conexion.Close();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.ToString());

                    }
                    finally
                    {
                        conexion.Close();
                    }
                }

            }
            catch (MySqlException ex)
            {
                MessageBox.Show("No se encontro DATO");

            }
            finally
            {
                conexion.Close();
            }
        }

        private void dataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void bunifuImageButton2_Click_1(object sender, EventArgs e)
        {
            TABLES.AllowUserToAddRows = true;
            TABLES.AllowUserToAddRows = false;
        

        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {


        }

        private void comboBox2_Click_1(object sender, EventArgs e)
        {


        }

        private void TABLES_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            
            
        }

        private void button4_Click(object sender, EventArgs e)
        {
            for (int i = 1; i <= rows; i++)
            {
                DataGridViewRow row = (DataGridViewRow)TABLES.RowTemplate.Clone();
                TABLES.Rows.Add(row);
            }
        }

        private void bunifuCustomLabel26_Click(object sender, EventArgs e)
        {

        }

        private void pictureBox13_Click(object sender, EventArgs e)
        {

        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void treeView1_AfterSelect(object sender, TreeViewEventArgs e)
        {

        }

        private void VLA_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void TABLAMODIFICAR_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
        //ARBOL//
        public void ARBOL()
        {

            Arboles.Nodes.Clear();

            try
            {
            
                MySqlCommand cmd = new MySqlCommand("SHOW DATABASES;", conexion);
               conexion.Open();
               MySqlDataReader dr = cmd.ExecuteReader();
              
                while (dr.Read() == true)
                {
                    string row = "";
                    for (i = 0; i < dr.FieldCount; i++)
                    {
                        row += dr.GetValue(i).ToString() + " ";
                        Arboles.Nodes.Add(row);
                        
                    }
                }
                conexion.Close(); }
               
                
            
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "ERROR",
                     MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                conexion.Close();
            }

        }
        //
    
            private void CREAR_Click(object sender, EventArgs e)
        {

        }

        private void button6_Click_1(object sender, EventArgs e)
        {

            if (comboBox1.SelectedItem == "1")
            {
                TABLE = NR1.Text + " " + TR1.Text;
            }
            else if (comboBox1.SelectedItem == "2")
            {
                TABLE = NR1.Text + " " + TR1.Text + " ," + NR2.Text + " " + TR2.Text;
            }
            else if (comboBox1.SelectedItem == "3")
            {
                TABLE = NR1.Text + " " + TR1.Text + " ," + NR2.Text + " " + TR3.Text + " ," + NR3.Text + " " + TR3.Text;
            }
            else if (comboBox1.SelectedItem == "4")
            {

                TABLE = NR1.Text + " " + TR1.Text + " ," + NR2.Text + " " + TR3.Text + " ," + NR3.Text + " " + TR3.Text + " ," + NR4.Text + " " + TR4.Text;
            }
            else if (comboBox1.SelectedItem == "5")
            {

                TABLE = NR1.Text + " " + TR1.Text + " ," + NR2.Text + " " + TR3.Text + " ," + NR3.Text + " " + TR3.Text + " ," + NR4.Text + " " + TR4.Text + " ," + NR5.Text + " " + TR5.Text;
            }

            try
            {
                conexion.Open();
                string BD = "create table " + TABLA.Text + "(" + TABLE + ")";
                MessageBox.Show(BD);

                MySqlCommand cmd = new MySqlCommand(BD, conexion);

                cmd.ExecuteNonQuery();
                MessageBox.Show("TABLA " + TABLA.Text + " CREADA CORRECTAMENTE");

                conexion.Close();
                NR1.Clear(); TXTCBD.Clear();
                NR2.Clear(); TABLA.Clear();
                NR3.Clear();
                NR4.Clear();
                NR5.Clear();
            }
            catch (Exception ex)
            {

                conexion.Close();
                MessageBox.Show(ex.Message,
                    "ERROR AL CREAR LA TABLA",
                    MessageBoxButtons.OK, MessageBoxIcon.Error);

            }
        }

        private void DATABASES1_SelectedIndexChanged_2(object sender, EventArgs e)
        {

        }

        private void TR1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        public void USARBaseDatos(ComboBox USABD)
            {


                try
                {
                    conexion.Open();
                    string ACEBD = "USE " + USABD.SelectedItem.ToString();
                    MessageBox.Show("BASE DE DATOS  ' " + USABD.SelectedItem.ToString() + " '  EN USO");
                    MySqlCommand cmd = new MySqlCommand(ACEBD, conexion);
                    cmd.ExecuteNonQuery();
                    conexion.Close();
                }
                catch (Exception ex)
                {


                    MessageBox.Show(ex.Message, "Error USAR la base", MessageBoxButtons.OK, MessageBoxIcon.Error);

                }
            }

            private void BUSCAR_Click(object sender, EventArgs e)
           {
            try
            {
                TAB = Tablas.SelectedItem.ToString();


                if (Campos.SelectedItem.ToString() == "TODO")
                {
                    try
                    {
                        conexion.Open();
                        TABLAMOSTRAR.DataSource = VistaTabla(TAB);
                        conexion.Close();
                    }
                    catch (MySqlException ex)
                    {
                        MessageBox.Show(ex.ToString());

                    }
                    finally { conexion.Close(); }
                }
                else if (Campos.SelectedItem.ToString() != "TODO")
                {
                    try
                    {
                        conexion.Open();
                        campo = Campos.SelectedItem.ToString();
                        oper = Condicion.SelectedItem.ToString();
                        valu = valor.Text;
                        MessageBox.Show("SELECT * FROM " + TABLA + " WHERE " + campo + " " + oper + "'" + valu + "';");

                        TABLAMOSTRAR.DataSource = VistaTablawhere(TAB, campo, oper, valu);
                        conexion.Close();
                    }
                    catch (MySqlException ex)
                    {
                        MessageBox.Show(ex.ToString());

                    }
                    finally { conexion.Close(); }
                }
            }
            catch (MySqlException ex)
            {
                MessageBox.Show(ex.ToString());
                conexion.Close();
            }
        }

        //----------------COLOR Y GRIP DE RECTANGULO INFERIOR
        protected override void OnPaint(PaintEventArgs e)
        {

            SolidBrush blueBrush = new SolidBrush(Color.FromArgb(55, 61, 69));
            e.Graphics.FillRectangle(blueBrush, sizeGripRectangle);

            base.OnPaint(e);
            ControlPaint.DrawSizeGrip(e.Graphics, Color.Transparent, sizeGripRectangle);
        }

        private void button5_Click(object sender, EventArgs e)
        {
            PanelConec.Visible = true;
        }

        

    }
}
