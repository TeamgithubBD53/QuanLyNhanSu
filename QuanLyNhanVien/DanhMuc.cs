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
        public static int kt3 = 0; // kiểm tra thêm, sửa, xóa bao hiem

        public DanhMuc()
        {
            InitializeComponent();

            dataGridView3.ReadOnly = true;
            getData3();

            dataGridView4.ReadOnly = true;
            getData4();
        }
        public void getData3()
        {
            KetNoi kn = new KetNoi();
            dataGridView3.DataSource = kn.LoadData("DanhSachBH");
        }
        //private void dataGridView3_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        //{
        //    try
        //    {
        //        DataGridViewRow row = new DataGridViewRow();
        //        row = dataGridView3.Rows[e.RowIndex];
        //        textMaBH3.Text = row.Cells[0].Value.ToString();
        //        textTenBH3.Text = row.Cells[1].Value.ToString();
        //        textTiLeBH3.Text = row.Cells[2].Value.ToString();
        //    }
        //    catch (Exception ex)
        //    {
        //        XtraMessageBox.Show(ex.Message);
        //    }
        //}
        //bao hiem

        private void butSua3_Click(object sender, EventArgs e)
        {
            kt3 = 2;
        }

        private void butXoa3_Click(object sender, EventArgs e)
        {
            kt3 = 3;
        }
        private void butThem3_Click(object sender, EventArgs e)
        {
            kt3 = 1;
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

        private void dataGridView3_CellContentClick(object sender, DataGridViewCellEventArgs e)
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
    }
}