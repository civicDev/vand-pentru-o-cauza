<?php if ($beneficiary_request['beneficiary_changegroup']=='0' && $beneficiary_request['beneficiary_approved']=='0' && $beneficiary_request['beneficiary_group_id']=='0') { ?>
				  
				   <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> 
				  <?php echo $text_not_beneficiary; ?>
				  </div>
  <?php } elseif ($beneficiary_request['beneficiary_changegroup']!='0' && $beneficiary_request['beneficiary_approved']=='0' && $beneficiary_request['beneficiary_group_id']=='0') { ?>
					 <div class="alert alert-success"><i class="fa fa-check-circle"></i> 
		       <?php echo $text_request; ?>
		       </div>
<?php } elseif ($beneficiary_request['beneficiary_changegroup']!='0' && $beneficiary_request['beneficiary_approved']=='0' && $beneficiary_request['beneficiary_group_id']!='0') { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> 
		       <?php echo $text_beneficiary_no_approved; ?>
		       </div>
<?php } elseif ($beneficiary_request['beneficiary_changegroup']!='0' && $beneficiary_request['beneficiary_approved']!='0' && $beneficiary_request['beneficiary_group_id']!='0') { ?>
					  <div class="alert alert-success"><i class="fa fa-check-circle"></i> 
		       <?php echo $text_beneficiary; ?>
		       </div>   

		           <?php } ?>

<?php  if ($beneficiary_request['beneficiary_changegroup']!= $beneficiary_request['beneficiary_group_id']) { ?>
					  <div class="alert alert-danger" id="hidealert"><i class="fa fa-check-circle"></i> 
		       <?php echo $text_beneficiary_change_group; ?>
		         </div>   
		         
		           <?php } ?>
<script type="text/javascript"><!--
$('#cancelrequest').bind('click', function() {
	
	$.ajax({
		url: 'index.php?route=beneficiaryprofile/beneficiaryprofile/cancelrequest',
		type: 'post',
		data: '',
		dataType: 'json',
		success: function(json) {
					
			if (json['error']) {
				$('.alert').html('<i class="fa fa-exclamation-circle"></i> ' + json['error']);
			} 
			
			if (json['success']) {
				$('#hidealert').hide();
							
			}	
		}
	});
});
//--></script>
