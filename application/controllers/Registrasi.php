<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Registrasi extends CI_Controller {

	public function index()
	{
		$this->form_validation->set_rules('nama','Nama Lengkap','required|alpha', array(
			'required' => '%s harus diisi',
			'alpha' => '%s wajib menggunakan huruf'
		));
		$this->form_validation->set_rules('namapengguna','Nama Pengguna','required|trim|alpha_numeric|is_unique[users.user_username]', array(
			'required' => '%s harus diisi',
			'is_unique' => '%s telah tersedia, gunakan nama lain',
			'alpha_numeric' => '%s wajib menggunakan huruf dan angka'
		));
		$this->form_validation->set_rules('email','Email','required|trim|valid_email|is_unique[users.user_email]', array(
			'required' => '%s harus diisi',
			'valid_email' => '%s harus menggunakan email yang valid contoh: fandi@gmail.com',
			'is_unique' => '%s telah tersedia, nama lain'

		));
		$this->form_validation->set_rules('password','Kata Sandi','required', array('required' => '%s harus diisi'));
		$this->form_validation->set_rules('password2','Ulangi Kata Sandi','required', array('required' => '%s harus diisi'));
		$this->form_validation->set_rules('setuju', '...', 'callback_setuju');
		if ($this->form_validation->run() == false) {
			$this->load->view('daftar');
		} else {
			$data = array(
				'user_nama' => htmlspecialchars($this->input->post('nama')), 
				'user_username' => htmlspecialchars($this->input->post('namapengguna')), 
				'user_email' => htmlspecialchars($this->input->post('email')), 
				'user_pangkat' => 'user', 
				'user_tanggal' => date('Y-m-d'), 
				'user_password' => md5($this->input->post('password'))
			);
			$this->load->model('M_users');
			$this->M_users->masukan_data($data);
			$this->session->set_flashdata('pesan','<div style="color:green;font-size:20px;margin-top:10px;padding:10px;border-radius:5px; border:2px solid green; width:200px;">Registrasi Berhasil</div>');
			redirect(base_url('registrasi'));
		}
		
	}

	public function setuju(){
		if ($this->input->post('setuju')) return true;
	    $this->form_validation->set_message('setuju', 'Silahkan ceklis terlebih dahulu ketentuan pengguna dan kebijakan privasi');
	    return false;
	}
}
