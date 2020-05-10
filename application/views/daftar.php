<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>PAUD Binas Siswa Mandiri - Form Registrasi</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- MATERIAL DESIGN ICONIC FONT -->
    <link rel="stylesheet" href="<?= base_url();?>assets/template/fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
    
    <!-- STYLE CSS -->
    <link rel="stylesheet" href="<?= base_url();?>assets/template/css/style.css">
    <style type="text/css">
      small {
        padding-left:15px; 
        padding-top:5px; 
        color: red; 
        display: block;
      }
    </style>
  </head>

  <body>
<h1 style="text-align:center; margin-top:20px;">Selamat datang di PAUD Bina Siswa Mandiri</h1>
<center><?php echo $this->session->flashdata('pesan') ?></center>
    <div class="wrapper" style="background-image: url('images/bg-registration-form-2.jpg');">

      <div class="inner">
        <form action="" method="post">
          <h3>PENDAFTARAN SISWA BARU</h3>
          <div class="form-wrapper">
            <label for="">Nama Lengkap</label>
            <input type="text" class="form-control" name="nama" value="<?= set_value('nama'); ?>">
            <small ><?= form_error('nama'); ?></small>
          </div>
          <div class="form-wrapper">
            <label for="">Nama Pengguna</label>
            <input type="text" class="form-control" name="namapengguna" value="<?= set_value('namapengguna'); ?>">
            <small><?= form_error('namapengguna'); ?></small>
          </div>
          <div class="form-wrapper">
            <label for="">Email</label>
            <input type="text" class="form-control" name="email" value="<?= set_value('email'); ?>">
            <small><?= form_error('email'); ?></small>
          </div>
          <div class="form-wrapper">
            <label for="">Kata Sandi</label>
            <input type="password" class="form-control" name="password">
            <small><?= form_error('password'); ?></small>
          </div>
          <div class="form-wrapper">
            <label for="">Ulangi Kata Sandi</label>
            <input type="password" class="form-control" name="password2">
            <small><?= form_error('password2'); ?></small>
          </div>
          <div class="checkbox">
            <label>
              <input type="checkbox" name="setuju"> Saya menerima Ketentuan Penggunaan & Kebijakan Privasi.
              <span class="checkmark"></span>
            </label>
            
          </div><br>
          <small><?= form_error('setuju'); ?></small>
          <button>Daftar Sekarang</button>
        </form>
      </div>
    </div>
    
  </body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>