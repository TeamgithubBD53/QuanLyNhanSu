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
//Author: khanhnguyenk8
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

        private void searchLookUpEdit1_EditValueChanged(object sender, EventArgs e)
        {
            var view = searchLookUpEdit1.Properties.View;
            int rowHandle = view.FocusedRowHandle;
            string fieldName1 = "Mã lương";
            string fieldName2 = "Mã nhân viên";
            string fieldName3 = "Lương";
            string fieldName4 = "Số ngày công";
            string fieldName5 = "Tháng/năm";
            object value1 = view.GetRowCellValue(rowHandle, fieldName1);
            object value2 = view.GetRowCellValue(rowHandle, fieldName2);
            object value3 = view.GetRowCellValue(rowHandle, fieldName3);
            object value4 = view.GetRowCellValue(rowHandle, fieldName4);
            object value5 = view.GetRowCellValue(rowHandle, fieldName5);
            textMaLuong.Text = value1.ToString();
            textMaNV.Text = value2.ToString();
            textLuongHD.Text = value3.ToString();
            textSoNgayCong.Text = value4.ToString();
            textThang.Text = value5.ToString();

        }

        private void butThem1_Click(object sender, EventArgs e)
        {
            kt1 = 1;
        }

        private void butSua1_Click(object sender, EventArgs e)
        {
            kt1 = 2;
        }

        private void butXoa1_Click(object sender, EventArgs e)
        {
            kt1 = 3;
        }

        private void butLuu1_Click(object sender, EventArgs e)
        {
            KetNoi kn = new KetNoi();
            if (kt1 == 1)
            {
                if (kn.LoadDataDK("LuongDK", "@MaLuong", textMaLuong.Text).Rows.Count == 1)
                    XtraMessageBox.Show("Mã Lương đã có trong danh sách");
                else
                {
                    kn.LuongNV("ThemLuong", textMaLuong.Text, textMaNV.Text, textLuongHD.Text, textSoNgayCong.Text, textThang.Text);
                }
            }
            else if (kt1 == 2)
            {
                if (kn.LoadDataDK("LuongDK", "@MaLuong", textMaLuong.Text).Rows.Count == 0)
                    XtraMessageBox.Show("Không tìm thấy mã Lương để sửa ");
                else
                {
                    kn.LuongNV("SuaLuong", textMaLuong.Text, textMaNV.Text, textLuongHD.Text, textSoNgayCong.Text, textThang.Text);
                }
            }
            else if (kt1 == 3)
            {
                try
                {
                    if (kn.LoadDataDK("LuongDK", "@MaLuong", textMaLuong.Text).Rows.Count == 0)
                        XtraMessageBox.Show("Không tìm thấy mã lương để xóa ");
                    else
                    {
                        kn.Xoa("XoaLuong", "@MaLuong", textMaLuong.Text);
                    }
                }
                catch (Exception ex)
                {
                    XtraMessageBox.Show(ex.Message);
                }

            }
            getData1();
            kt1 = 0;

        }

        private void butXuat_Click(object sender, EventArgs e)
        {
            KetNoi kn = new KetNoi();
            DataTable dt = kn.LoadData("XuatDanhSachLuongNV");

            if (dt.Rows.Count == 0)
                XtraMessageBox.Show("Không có dữ liệu để xuất");
            else
            {

                kn.LoadDataSet("XuatDanhSachLuongNV").WriteXml(@"D:\'Danh sách lương nhân viên'.xls");
                XtraMessageBox.Show("Xuất thành công");
            }

        }
    }
}