<?php
	class ModelCatalogpincode extends Model {
		
		public function putmypin($pincode,$service) {
			$query = $this->db->query("INSERT INTO pincheck (`id`, `pincode`, `service_available`) VALUES (NULL, '".$pincode."', '".$service."')") ;
		}
		public function uploadfile($col1,$upload_service) {
			$query = $this->db->query("INSERT INTO pincheck (`id`, `pincode`, `service_available`) VALUES (NULL, '".$col1."', '".$upload_service."')");
		}
		public function updateuploadpin($col1,$upload_service){
			$query = $this->db->query("UPDATE pincheck SET service_available = '".$upload_service."' WHERE pincode = '".$col1."'");
		}
		public function checkmypin($pincode) {
			$query = $this->db->query("SELECT count(*) FROM pincheck WHERE pincode = '".$pincode."'");
			return $query->row;
		}
		public function getmypin($data,$select) {
			$query = $this->db->query("SELECT * FROM pincheck ".$select." LIMIT " . (int)$data['start'] . "," . (int)$data['limit']."");
			return $query->rows;
		}
		public function pincount($select) {
			$query = $this->db->query("SELECT count(*) FROM pincheck ".$select);
			return $query->row;
		}
		public function editmypin($pinid) {
			$query = $this->db->query("SELECT * FROM pincheck WHERE id = '".$pinid."'");
			return $query->row;
		}
		public function updatemypin($e_pincode,$e_service,$pin_id) {
			$query = $this->db->query("UPDATE pincheck SET pincode = '".$e_pincode."', service_available = '".$e_service."' WHERE id = '".$pin_id."'");
		}
		public function deletemypin($pincode_id) {
			$query = $this->db->query("DELETE FROM `pincheck` WHERE `pincheck`.`id` = '".$pincode_id."'");
		}
			
		public function download_csv($select){
			$result = $this->db->query("select pincode from pincheck ".$select);
			return $result->rows;
		}
		
	}
?>