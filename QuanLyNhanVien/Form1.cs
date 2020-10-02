using DevExpress.XtraBars;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace QuanLyNhanVien
{
    public partial class Form1 : DevExpress.XtraBars.FluentDesignSystem.FluentDesignForm
    {
        public Form1()
        {
            InitializeComponent();
           
        }

        private void butQuanLyDanhMuc_Click(object sender, EventArgs e)
        {
            splitContainer1.Panel2.Controls.Clear();
            DanhMuc DM = new DanhMuc();
            DM.TopLevel = false;
            splitContainer1.Panel2.Controls.Add(DM);
            DM.Dock = DockStyle.Fill;
            DM.Show();
        }

        private void butQuanLyNV_Click(object sender, EventArgs e)
        {
            splitContainer1.Panel2.Controls.Clear();
            HoSoNV QL = new HoSoNV();
            QL.TopLevel = false;
            splitContainer1.Panel2.Controls.Add(QL);
            QL.Dock = DockStyle.Fill;
            QL.Show();
        }

        private void butQuanLyLuong_Click(object sender, EventArgs e)
        {
            splitContainer1.Panel2.Controls.Clear();
            Luong Luong = new Luong();
            Luong.TopLevel = false;
            splitContainer1.Panel2.Controls.Add(Luong);
            Luong.Dock = DockStyle.Fill;
            Luong.Show();
        }

        private void butThoat_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
