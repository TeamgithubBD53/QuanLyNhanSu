using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraEditors;

namespace QuanLyNhanVien
{
    public partial class Luong : DevExpress.XtraEditors.XtraForm
    {
        public static int kt1 = 0; // kiểm tra thêm, sửa, xóa

        public Luong()
        {
            InitializeComponent();
            dataGridView1.ReadOnly = true;
            textLuongHD.ReadOnly = true;
            getData1();
        }
        public void getData1()
        {
            KetNoi kn = new KetNoi();
            dataGridView1.DataSource = kn.LoadData("DanhSachLuong");
            DataTable dt = kn.LoadData("DanhSachLuong");
            dt.Columns[0].ColumnName = "Mã lương";
            dt.Columns[1].ColumnName = "Mã nhân viên";
            dt.Columns[2].ColumnName = "Lương";
            dt.Columns[3].ColumnName = "Số ngày công";
            dt.Columns[4].ColumnName = "Tháng/năm";
            searchLookUpEdit1.Properties.DataSource = dt;
            textTongTien.Text = kn.LoadData("TongLuong").Rows[0][0].ToString();
        }
        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridView1_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                DataGridViewRow row = new DataGridViewRow();
                row = dataGridView1.Rows[e.RowIndex];
                textMaLuong.Text = row.Cells[0].Value.ToString();
                textMaNV.Text = row.Cells[1].Value.ToString();
                textLuongHD.Text = row.Cells[2].Value.ToString();
                textSoNgayCong.Text = row.Cells[3].Value.ToString();
                textThang.Text = row.Cells[4].Value.ToString();
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show(ex.Message);
            }

        }
    }
}