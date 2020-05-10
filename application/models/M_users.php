<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_users extends CI_Model {

	function masukan_data($data){
		$this->db->insert('users',$data);
	}

}