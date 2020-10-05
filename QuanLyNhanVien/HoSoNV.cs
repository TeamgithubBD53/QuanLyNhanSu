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
            getData2();
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
        public void getData2()
        {
            KetNoi kn = new KetNoi();
            dataGridView2.DataSource = kn.LoadData("DanhSachHD");
        }
       

        private void dataGridView1_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                DataGridViewRow row = new DataGridViewRow();
                row = dataGridView1.Rows[e.RowIndex];
                textMaNV1.Text = row.Cells[0].Value.ToString();
                textMaTD1.Text = row.Cells[1].Value.ToString();
                textMaCV1.Text = row.Cells[2].Value.ToString();
                textMaPB1.Text = row.Cells[3].Value.ToString();
                textHoTen.Text = row.Cells[5].Value.ToString();
                textNgaySinh1.Text = row.Cells[6].Value.ToString().Substring(0, 10);
                textQueQuan1.Text = row.Cells[7].Value.ToString();
                textGioiTinh1.Text = row.Cells[8].Value.ToString();
                textCMND.Text = row.Cells[9].Value.ToString();
                textTrinhDo1.Text = row.Cells[10].Value.ToString();
                textSDT1.Text = row.Cells[11].Value.ToString();
                textNoiLamViec.Text = row.Cells[4].Value.ToString();
                textNoiO.Text = row.Cells[13].Value.ToString();
                textNoiSinh.Text = row.Cells[14].Value.ToString();
                textEmail.Text = row.Cells[12].Value.ToString();
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show(ex.Message);
            }
        }

        private void dataGridView2_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                DataGridViewRow row = new DataGridViewRow();
                row = dataGridView2.Rows[e.RowIndex];
                textMaHD2.Text = row.Cells[0].Value.ToString();
                textMaNV2.Text = row.Cells[1].Value.ToString();
                textLuongHD2.Text = row.Cells[2].Value.ToString();
                textNgayBD2.Text = row.Cells[3].Value.ToString().Substring(0, 10);
                textNgayKetThuc2.Text = row.Cells[4].Value.ToString().Substring(0, 10);
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
            string fieldName1 = "Mã NV";
            string fieldName2 = "Mã tuyển dụng";
            string fieldName3 = "Mã CV";
            string fieldName4 = "Mã phòng ban";
            string fieldName5 = "Họ tên";
            string fieldName6 = "Ngày sinh";
            string fieldName7 = "Quê quán";
            string fieldName8 = "Giới tính";
            string fieldName9 = "CMND";
            string fieldName10 = "Trình độ";
            string fieldName11 = "SĐT";
            string fieldName12 = "Nơi làm việc";
            string fieldName13 = "Nơi ở";
            string fieldName14 = "Nơi sinh";
            string fieldName15 = "Email";
            object value1 = view.GetRowCellValue(rowHandle, fieldName1);
            object value2 = view.GetRowCellValue(rowHandle, fieldName2);
            object value3 = view.GetRowCellValue(rowHandle, fieldName3);
            object value4 = view.GetRowCellValue(rowHandle, fieldName4);
            object value5 = view.GetRowCellValue(rowHandle, fieldName5);
            object value6 = view.GetRowCellValue(rowHandle, fieldName6);
            object value7 = view.GetRowCellValue(rowHandle, fieldName7);
            object value8 = view.GetRowCellValue(rowHandle, fieldName8);
            object value9 = view.GetRowCellValue(rowHandle, fieldName9);
            object value10 = view.GetRowCellValue(rowHandle, fieldName10);
            object value11 = view.GetRowCellValue(rowHandle, fieldName11);
            object value12 = view.GetRowCellValue(rowHandle, fieldName12);
            object value13 = view.GetRowCellValue(rowHandle, fieldName13);
            object value14 = view.GetRowCellValue(rowHandle, fieldName14);
            object value15 = view.GetRowCellValue(rowHandle, fieldName15);

            textMaNV1.Text = value1.ToString();
            textMaTD1.Text = value2.ToString();
            textMaCV1.Text = value3.ToString();
            textMaPB1.Text = value4.ToString();
            textHoTen.Text = value5.ToString();
            textNgaySinh1.Text = value6.ToString().Substring(0, 10);
            textQueQuan1.Text = value7.ToString();
            textGioiTinh1.Text = value8.ToString();
            textCMND.Text = value9.ToString();
            textTrinhDo1.Text = value10.ToString();
            textSDT1.Text = value11.ToString();
            textNoiLamViec.Text = value12.ToString();
            textNoiO.Text = value13.ToString();
            textNoiSinh.Text = value14.ToString();
            textEmail.Text = value15.ToString();
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
                if (kn.LoadDataDK("NhanVienDK", "@MaNV", textMaNV1.Text).Rows.Count == 1)
                    XtraMessageBox.Show("Mã nhân viên đã có trong danh sách");
                else
                {
                    kn.DanhSachNV("ThemNV", textMaNV1.Text, textMaTD1.Text, textMaCV1.Text, textMaPB1.Text, textNoiLamViec.Text, textHoTen.Text, textNgaySinh1.Text, textQueQuan1.Text
                        , textGioiTinh1.Text, textCMND.Text, textTrinhDo1.Text, textSDT1.Text, textEmail.Text, textNoiO.Text, textNoiSinh.Text);
                }
            }
            else if (kt1 == 2)
            {
                if (kn.LoadDataDK("NhanVienDK", "@MaNV", textMaNV1.Text).Rows.Count == 0)
                    XtraMessageBox.Show("Mã nhân viên chưa có trong danh sách");
                else
                {
                    kn.DanhSachNV("SuaNV", textMaNV1.Text, textMaTD1.Text, textMaCV1.Text, textMaPB1.Text, textNoiLamViec.Text, textHoTen.Text, textNgaySinh1.Text, textQueQuan1.Text
                        , textGioiTinh1.Text, textCMND.Text, textTrinhDo1.Text, textSDT1.Text, textEmail.Text, textNoiO.Text, textNoiSinh.Text);
                }
            }
            else if (kt1 == 3)
            {
                try
                {
                    if (kn.LoadDataDK("NhanVienDK", "@MaNV", textMaNV1.Text).Rows.Count == 0)
                        XtraMessageBox.Show("Không tìm thấy mã nhân viên để xóa ");
                    else
                    {
                        kn.Xoa("XoaNV", "@MaNV", textMaNV1.Text);
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
        private void butXuat_Click_1(object sender, EventArgs e)
        {
            KetNoi kn = new KetNoi();
            DataTable dt = kn.LoadData("XuatDanhSachNV");

            if (dt.Rows.Count == 0)
                XtraMessageBox.Show("Không có dữ liệu để xuất");
            else
            {

                kn.LoadDataSet("XuatDanhSachNV").WriteXml(@"D:\'Danh sách nhân viên'.xls");
                XtraMessageBox.Show("Xuất thành công");
            }
        }
        //hopdong
        private void butThem2_Click(object sender, EventArgs e)
        {
            kt2 = 1;
        }
        private void butSua2_Click(object sender, EventArgs e)
        {
            kt2 = 2;
        }

        private void butXoa2_Click(object sender, EventArgs e)
        {
            kt2 = 3;
        }


        private void butLuu2_Click(object sender, EventArgs e)
        {
            KetNoi kn = new KetNoi();
            if (kt2 == 1)
            {
                if (kn.LoadDataDK("HopDongDK", "@MaHD", textMaHD2.Text).Rows.Count == 1)
                    XtraMessageBox.Show("Mã hợp đồng đã có trong danh sách");
                else
                {
                    kn.HopDong("ThemHD", textMaHD2.Text, textMaNV2.Text, textLuongHD2.Text, textNgayBD2.Text, textNgayKetThuc2.Text);
                }
            }
            else if (kt2 == 2)
            {
                if (kn.LoadDataDK("HopDongDK", "@MaHD", textMaHD2.Text).Rows.Count == 0)
                    XtraMessageBox.Show("Mã hợp đồng chưa có trong danh sách");
                else
                {
                    kn.HopDong("SuaHD", textMaHD2.Text, textMaNV2.Text, textLuongHD2.Text, textNgayBD2.Text, textNgayKetThuc2.Text);
                }
            }
            else if (kt2 == 3)
            {
                try
                {
                    if (kn.LoadDataDK("HopDongDK", "@MaHD", textMaHD2.Text).Rows.Count == 0)
                        XtraMessageBox.Show("Không tìm thấy mã hợp đồng để xóa ");
                    else
                    {
                        kn.Xoa("XoaHD", "@MaHD", textMaHD2.Text);
                    }
                }
                catch (Exception ex)
                {
                    XtraMessageBox.Show(ex.Message);
                }

            }
            getData2();
            kt2 = 0;
        }


    }
}