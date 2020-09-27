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
    public partial class HoSoNV : DevExpress.XtraEditors.XtraForm
    {
        public static int kt1 = 0; // kiểm tra thêm, sửa, xóa
        public static int kt2 = 0;// kiểm tra thêm, sửa, xóa
        public HoSoNV()
        {
            InitializeComponent();
            dataGridView1.ReadOnly = true;
            dataGridView2.ReadOnly = true;
            getData1();
        }
        public void  getData1()
        {
            KetNoi kn = new KetNoi();
            dataGridView1.DataSource = kn.LoadData("DanhSachNV");
            DataTable dt = kn.LoadData("DanhSachNV");
            dt.Columns[0].ColumnName = "Mã NV";
            dt.Columns[1].ColumnName = "Mã tuyển dụng";
            dt.Columns[2].ColumnName = "Mã CV";
            dt.Columns[3].ColumnName = "Mã phòng ban";
            dt.Columns[4].ColumnName = "Nơi làm việc";
            dt.Columns[5].ColumnName = "Họ tên";
            dt.Columns[6].ColumnName = "Ngày sinh";
            dt.Columns[7].ColumnName = "Quê quán";
            dt.Columns[8].ColumnName = "Giới tính";
            dt.Columns[9].ColumnName = "CMND";
            dt.Columns[10].ColumnName = "Trình độ";
            dt.Columns[11].ColumnName = "SĐT";
            dt.Columns[12].ColumnName = "Email";
            dt.Columns[13].ColumnName = "Nơi ở";
            dt.Columns[14].ColumnName = "Nơi sinh";
        }
        private void butThem1_Click(object sender, EventArgs e)
        {
            kt1 = 1;
        }
    }
}