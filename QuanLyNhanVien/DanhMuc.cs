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
    public partial class DanhMuc : DevExpress.XtraEditors.XtraForm
    {
        public static int kt1 = 0; //kiểm tra thêm, sửa, xóa chức vụ
        public static int kt2 = 0; // kiểm tra thêm, sửa, xóa phong ban
        public static int kt3 = 0; // kiểm tra thêm, sửa, xóa bao hiem
        public static int kt5 = 0; // kiểm tra thêm, sửa, xóa bao hiem
        public static int kt6 = 0; // kiểm tra thêm, sửa, xóa bao hiem
        public DanhMuc()
        {
            InitializeComponent();
            
            dataGridViewChucVu.ReadOnly = true;
            getDataChucVu();

            dataGridView2.ReadOnly = true;
            getData2();

            dataGridView3.ReadOnly = true;
            getData3();

            dataGridView4.ReadOnly = true;
            getData4();

            dataGridView5.ReadOnly = true;
            getData5();

            dataGridView6.ReadOnly = true;
            getData6();

            dataGridView7.ReadOnly = true;
            textSoTien7.ReadOnly = true;
            getData7();
            LoadMaKTKL6();
            LoadMaNV6();
            LoadMaBH7();
            LoadMaNV7();
        }

        public void getDataChucVu()
        {
            KetNoi kn = new KetNoi();
            dataGridViewChucVu.DataSource = kn.LoadData("DSChucVu");
        }
        public void getData2()
        {
            KetNoi kn = new KetNoi();
            dataGridView2.DataSource = kn.LoadData("DSPhongBan");
        }
        public void getData3()
        {
            KetNoi kn = new KetNoi();
            dataGridView3.DataSource = kn.LoadData("DanhSachBH");
        }
        public void getData5()
        {
            KetNoi kn = new KetNoi();
            dataGridView5.DataSource = kn.LoadData("QuyetDinhKTKL");
        }
       
        private void DataGridView3_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                DataGridViewRow row = new DataGridViewRow();
                row = dataGridView3.Rows[e.RowIndex];
                textMaBH3.Text = row.Cells[0].Value.ToString();
                textTenBH3.Text = row.Cells[1].Value.ToString();
                textTiLeBH3.Text = row.Cells[2].Value.ToString();
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show(ex.Message);
            }

        }
        //bao hiem



        private void butThem3_Click(object sender, EventArgs e)
        {
            kt3 = 1;
        }
        private void butSua3_Click(object sender, EventArgs e)
        {
            kt3 = 2;
        }
        private void butXoa3_Click(object sender, EventArgs e)
        {
            kt3 = 3;
        }
        private void butLuu3_Click(object sender, EventArgs e)
        {

            KetNoi kn = new KetNoi();
            if (kt3 == 1)
            {
                if (kn.LoadDataDK("BaoHiemDK", "@MaBH", textMaBH3.Text).Rows.Count == 1)
                    XtraMessageBox.Show("Mã bảo hiểm đã có trong danh sách");
                else
                {
                    kn.DanhMucBH("ThemBH", textMaBH3.Text, textTenBH3.Text, textTiLeBH3.Text);
                }
            }
            else if (kt3 == 2)
            {

                if (kn.LoadDataDK("BaoHiemDK", "@MaBH", textMaBH3.Text).Rows.Count == 0)
                    XtraMessageBox.Show("Mã bảo hiểm chưa có trong danh sách");
                else
                {
                    kn.DanhMucBH("SuaBH", textMaBH3.Text, textTenBH3.Text, textTiLeBH3.Text);
                }
            }
            else if (kt3 == 3)
            {
                try
                {
                    if (kn.LoadDataDK("BaoHiemDK", "@MaBH", textMaBH3.Text).Rows.Count == 0)
                        XtraMessageBox.Show("Không tìm thấy mã Bảo hiểm để xóa");
                    else
                    {
                        kn.Xoa("XoaBH", "@MaBH", textMaBH3.Text);
                    }
                }
                catch (Exception ex)
                {
                    XtraMessageBox.Show(ex.Message);
                }

            }
            getData3();
            kt3 = 0;
        }


        //tuyển dụng

        public static int kt4 = 0; // kiểm tra thêm, sửa, xóa tuyển dụng

        public void getData4()
        {
            KetNoi kn = new KetNoi();
            dataGridView4.DataSource = kn.LoadData("TuyenDung");
        }

        private void dataGridView4_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                DataGridViewRow row = new DataGridViewRow();
                row = dataGridView4.Rows[e.RowIndex];
                textMaTD4.Text = row.Cells[0].Value.ToString();
                textTenTD4.Text = row.Cells[1].Value.ToString();
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show(ex.Message);
            }
        }

        private void butThem4_Click(object sender, EventArgs e)
        {
            kt4 = 1;
        }

        private void butSua4_Click(object sender, EventArgs e)
        {
            kt4 = 2;
        }

        private void butXoa4_Click(object sender, EventArgs e)
        {
            kt4 = 3;
        }

        private void butLuu4_Click(object sender, EventArgs e)
        {
            KetNoi kn = new KetNoi();
            if (kt4 == 1)
            {
                if (kn.LoadDataDK("TuyenDungDK", "@MaTD", textMaTD4.Text).Rows.Count == 1)
                    XtraMessageBox.Show("Mã tuyển dụng đã có trong danh sách");
                else
                {
                    kn.TuyenDung("ThemTD", textMaTD4.Text, textTenTD4.Text);
                }
            }
            else if (kt4 == 2)
            {
                if (kn.LoadDataDK("TuyenDungDK", "@MaTD", textMaTD4.Text).Rows.Count == 0)
                    XtraMessageBox.Show("Mã tuyển dụng chưa có trong danh sách");
                else
                {
                    kn.TuyenDung("SuaTD", textMaTD4.Text, textTenTD4.Text);
                }
            }
            else if (kt4 == 3)
            {
                try
                {
                    if (kn.LoadDataDK("TuyenDungDK", "@MaTD", textMaTD4.Text).Rows.Count == 0)
                        XtraMessageBox.Show("Không tìm thấy mã tuyển dụng để xóa ");
                    else
                    {
                        kn.Xoa("XoaTD", "@MaTD", textMaTD4.Text);
                    }
                }
                catch (Exception ex)
                {
                    XtraMessageBox.Show(ex.Message);
                }

            }
            getData4();
            kt4 = 0;
        }

        //Danh sach bao hiem

        public static int kt7 = 0; // kiểm tra thêm, sửa, xóa

        public void getData7()
        {
            KetNoi kn = new KetNoi();
            dataGridView7.DataSource = kn.LoadData("BHNhanVien");
        }

        private void butThem7_Click(object sender, EventArgs e)
        {
            kt7 = 1;
        }

        private void butSua7_Click(object sender, EventArgs e)
        {
            kt7 = 2;
        }

        private void butXoa7_Click(object sender, EventArgs e)
        {
            kt7 = 3;
        }

        private void butLuu7_Click(object sender, EventArgs e)
        {
            KetNoi kn = new KetNoi();
            if (kt7 == 1)
            {
                if (kn.LoadDataDK_2DK("DanhSachBHNV", "@MaBH", "@MaNV", textMaBH7.Text, textMaNV7.Text).Rows.Count == 1)
                    XtraMessageBox.Show("Mã bảo hiểm này đã có trong danh sách");
                else
                {
                    kn.BaoHiemNV("ThemBaoHiemNV", textMaBH7.Text, textMaNV7.Text, textNgayBD7.Text, textNgayKT7.Text, textSoTien7.Text);
                }
            }
            else if (kt7 == 2)
            {

                if (kn.LoadDataDK_2DK("DanhSachBHNV", "@MaBH", "@MaNV", textMaBH7.Text, textMaNV7.Text).Rows.Count == 0)
                    XtraMessageBox.Show("Mã bảo hiểm này chưa có trong danh sách");
                else
                {
                    kn.BaoHiemNV("SuaBaoHiemNV", textMaBH7.Text, textMaNV7.Text, textNgayBD7.Text, textNgayKT7.Text, textSoTien7.Text);
                }
            }
            else if (kt7 == 3)
            {
                try
                {
                    if (kn.LoadDataDK_2DK("DanhSachBHNV", "@MaBH", "@MaNV", textMaBH7.Text, textMaNV7.Text).Rows.Count == 0)
                        XtraMessageBox.Show("Mã bảo hiểm này đã có trong danh sách");
                    else
                    {
                        kn.Xoa_2DK("XoaBaoHiemNV", "@MaBH", "@MaNV", textMaBH7.Text, textMaNV7.Text);
                    }
                }
                catch (Exception ex)
                {
                    XtraMessageBox.Show(ex.Message);
                }

            }
            getData7();
            kt7 = 0;
        }

        private void dataGridView7_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                DataGridViewRow row = new DataGridViewRow();
                row = dataGridView7.Rows[e.RowIndex];
                textMaNV7.Text = row.Cells[0].Value.ToString();
                textMaBH7.Text = row.Cells[1].Value.ToString();
                textNgayBD7.Text = row.Cells[2].Value.ToString().Substring(0, 10);
                textNgayKT7.Text = row.Cells[3].Value.ToString().Substring(0, 10);
                textSoTien7.Text = row.Cells[4].Value.ToString();
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show(ex.Message);
            }
        }
       
        private void btnThemChucVu_Click(object sender, EventArgs e)
        {
            kt1 = 1;
        }

        private void btnSuaChucVu_Click(object sender, EventArgs e)
        {
            kt1 = 2;
        }

        private void btnXoaChucVu_Click(object sender, EventArgs e)
        {
            kt1 = 3;
        }
        private void btnLuuChucVu_Click(object sender, EventArgs e)
        {
            KetNoi kn = new KetNoi();
            if (kt1 == 1)
            {
                if (kn.LoadDataDK("ChucVuDK", "@MaCV", textMaCV.Text).Rows.Count == 1)
                    XtraMessageBox.Show("Mã chức vụ đã có trong danh sách");
                else
                {
                    kn.ChucVu("ThemCV", textMaCV.Text, textTenCV.Text, textPhuCap.Text);
                }
            }
            else if (kt1 == 2)
            {
                if (kn.LoadDataDK("ChucVuDK", "@MaCV", textMaCV.Text).Rows.Count == 0)
                    XtraMessageBox.Show("Mã chức vụ chưa có trong danh sách");
                else
                {
                    kn.ChucVu("SuaCV", textMaCV.Text, textTenCV.Text, textPhuCap.Text);
                }
            }
            else if (kt1 == 3)
            {
                try
                {
                    if (kn.LoadDataDK("ChucVuDK", "@MaCV", textMaCV.Text).Rows.Count == 0)
                        XtraMessageBox.Show("Không tìm thấy mã chức vụ để xóa ");
                    else
                    {
                        kn.Xoa("XoaCV", "@MaChucVu", textMaCV.Text);
                    }
                }
                catch (Exception ex)
                {
                    XtraMessageBox.Show(ex.Message);
                }

            }
            getDataChucVu();
            kt1 = 0;
        }
        private void dataGridViewChucVu_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                DataGridViewRow row = new DataGridViewRow();
                row = dataGridViewChucVu.Rows[e.RowIndex];
                textMaCV.Text = row.Cells[0].Value.ToString();
                textTenCV.Text = row.Cells[1].Value.ToString();
                textPhuCap.Text = row.Cells[2].Value.ToString();
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show(ex.Message);
            }
        }
        private void dataGridView5_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                DataGridViewRow row = new DataGridViewRow();
                row = dataGridView5.Rows[e.RowIndex];
                textMaKTKL5.Text = row.Cells[0].Value.ToString();
                textTenQD5.Text = row.Cells[1].Value.ToString();
                textSoTien5.Text = row.Cells[2].Value.ToString();
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show(ex.Message);
            }
        }
        private void butThem5_Click(object sender, EventArgs e)
        {
            kt5 = 1;
        }

        private void butSua5_Click(object sender, EventArgs e)
        {
            kt5 = 2;
        }

        private void butXoa5_Click(object sender, EventArgs e)
        {
            kt5 = 3;
        }

        private void butLuu5_Click(object sender, EventArgs e)
        {
            KetNoi kn = new KetNoi();
            if (kt5 == 1)
            {
                if (kn.LoadDataDK("QuyDinhKTKLDK", "@MaKTKL", textMaKTKL5.Text).Rows.Count == 1)
                    XtraMessageBox.Show("Mã khen thưởng, kỉ luật này đã có trong danh sách");
                else
                {
                    kn.QuyDinhKTKL("ThemKTKL", textMaKTKL5.Text, textMaKTKL5.Text, textSoTien5.Text);
                }
            }
            else if (kt5 == 2)
            {
                if (kn.LoadDataDK("QuyDinhKTKLDK", "@MaKTKL", textMaKTKL5.Text).Rows.Count == 0)
                    XtraMessageBox.Show("Mã khen thưởng, kỉ luật này chưa có trong danh sách");
                else
                {
                    kn.QuyDinhKTKL("SuaKTKL", textMaKTKL5.Text, textTenQD5.Text, textSoTien5.Text);
                }
            }
            else if (kt5 == 3)
            {
                try
                {
                    if (kn.LoadDataDK("QuyDinhKTKLDK", "@MaKTKL", textMaKTKL5.Text).Rows.Count == 0)
                        XtraMessageBox.Show("Không tìm thấy mã quyết định KTKL để xóa ");
                    else
                    {
                        kn.Xoa("XoaKTKL", "@MaKTKL", textMaKTKL5.Text);
                    }
                }
                catch (Exception ex)
                {
                    XtraMessageBox.Show(ex.Message);
                }

            }
            getData5();
            kt5 = 0;
        }
      

        public void getData6()
        {
            KetNoi kn = new KetNoi();
            dataGridView6.DataSource = kn.LoadData("DanhSachKhenThuongKiLuat");
        }
        private void dataGridView6_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {

            try
            {
                DataGridViewRow row = new DataGridViewRow();
                row = dataGridView6.Rows[e.RowIndex];
                textMaKTKL6.Text = row.Cells[1].Value.ToString();
                textMaNV6.Text = row.Cells[0].Value.ToString();
                textNgay6.Text = row.Cells[2].Value.ToString().Substring(0, 10);
                textGhiChu6.Text = row.Cells[3].Value.ToString();
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show(ex.Message);
            }
        }
        private void butThem6_Click(object sender, EventArgs e)
        {
            kt6 = 1;
        }

        private void butSua6_Click(object sender, EventArgs e)
        {
            kt6 = 2;
        }

        private void butXoa6_Click(object sender, EventArgs e)
        {
            kt6 = 3;
        }

        private void butLuu6_Click(object sender, EventArgs e)
        {
            KetNoi kn = new KetNoi();
            if (kt6 == 1)
            {
                if (kn.LoadDataDK_2DK("DanhSachKTKLDK", "@MaKTKL", "@MaNV", textMaKTKL6.Text, textMaNV6.Text).Rows.Count == 1)
                    XtraMessageBox.Show("Nhân viên này đã được trao quyêt định");
                else
                {
                    kn.DanhSachKTKL("ThemDanhSachKTKL", textMaKTKL6.Text, textMaNV6.Text, textNgay6.Text, textGhiChu6.Text);
                }
            }
            else if (kt6 == 2)
            {
                if (kn.LoadDataDK_2DK("DanhSachKTKLDK", "@MaKTKL", "@MaNV", textMaKTKL6.Text, textMaNV6.Text).Rows.Count == 0)
                    XtraMessageBox.Show("Mã quyết định này chưa có");
                else
                {
                    kn.DanhSachKTKL("SuaDanhSachKTKL", textMaKTKL6.Text, textMaNV6.Text, textNgay6.Text, textGhiChu6.Text);
                }
            }
            else if (kt6 == 3)
            {
                try
                {
                    if (kn.LoadDataDK_2DK("DanhSachKTKLDK", "@MaKTKL", "@MaNV", textMaKTKL6.Text, textMaNV6.Text).Rows.Count == 0)
                        XtraMessageBox.Show("Không tìm thấy mã quyết định KTKL để xóa ");
                    else
                    {
                        kn.Xoa_2DK("XoaDanhSachKTKL", "@MaKTKL", "@MaNV", textMaKTKL6.Text, textMaNV6.Text);
                    }
                }
                catch (Exception ex)
                {
                    XtraMessageBox.Show(ex.Message);
                }

            }
            getData6();
            kt6 = 0;
        }

        private void butXuat_Click(object sender, EventArgs e)
        {
            KetNoi kn = new KetNoi();
            DataTable dt = kn.LoadData("XuatDanhSachKTKL");

            if (dt.Rows.Count == 0)
                XtraMessageBox.Show("Không có dữ liệu để xuất");
            else
            {

                kn.LoadDataSet("XuatDanhSachKTKL").WriteXml(@"D:\'Danh sách khen thưởng, kỉ luật'.xls");
                XtraMessageBox.Show("Xuất thành công");
            }
        }

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
                if (kn.LoadDataDK("PhongBanDK", "@MaPB", textMaPB2.Text).Rows.Count == 1)
                    XtraMessageBox.Show("Mã phòng ban đã có trong danh sách");
                else
                {
                    kn.PhongBan("ThemPB", textMaPB2.Text, textTenPB2.Text, textSDT.Text);
                }
            }
            else if (kt2 == 2)
            {
                if (kn.LoadDataDK("PhongBanDK", "@MaPB", textMaPB2.Text).Rows.Count == 0)
                    XtraMessageBox.Show("Mã phòng ban chưa có trong danh sách");
                else
                {
                    kn.PhongBan("SuaPB", textMaPB2.Text, textTenPB2.Text, textSDT.Text);
                }
            }
            else if (kt2 == 3)
            {
                try
                {
                    if (kn.LoadDataDK("PhongBanDK", "@MaPB", textMaPB2.Text).Rows.Count == 0)
                        XtraMessageBox.Show("Không tìm thấy mã phòng ban để xóa ");
                    else
                    {
                        kn.Xoa("XoaPB", "@MaPB", textMaPB2.Text);
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
    

        private void dataGridView2_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                DataGridViewRow row = new DataGridViewRow();
                row = dataGridView2.Rows[e.RowIndex];
                textMaPB2.Text = row.Cells[0].Value.ToString();
                textTenPB2.Text = row.Cells[1].Value.ToString();
                textSDT.Text = row.Cells[2].Value.ToString();
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show(ex.Message);
            }
        }
        public void LoadMaKTKL6()
        {
            KetNoi kn = new KetNoi();
            DataTable dt = kn.LoadData("QuyetDinhKTKL");
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                textMaKTKL6.Items.Add(dt.Rows[i][0]);
            }
        }
        public void LoadMaNV6()
        {
            KetNoi kn = new KetNoi();
            DataTable dt = kn.LoadData("XuatDanhSachNV");
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                textMaNV6.Items.Add(dt.Rows[i][0]);
            }
        }
        public void LoadMaBH7()
        {
            KetNoi kn = new KetNoi();
            DataTable dt = kn.LoadData("DanhSachMaBH");
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                textMaBH7.Items.Add(dt.Rows[i][0]);
            }
        }
        public void LoadMaNV7()
        {
            KetNoi kn = new KetNoi();
            DataTable dt = kn.LoadData("XuatDanhSachNV");
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                textMaNV7.Items.Add(dt.Rows[i][0]);
            }
        }

        
    }
}