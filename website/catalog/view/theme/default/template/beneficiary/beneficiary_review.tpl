<?php if ($beneficiaryreviews) { ?>
<?php foreach ($beneficiaryreviews as $beneficiaryreview) { ?>
<table class="table table-striped table-bordered">
  <tr>
    <td style="width: 50%;"><strong><?php echo $beneficiaryreview['beneficiary_name']; ?></strong></td>
    <td class="text-right"><?php echo $beneficiaryreview['date_added']; ?></td>
  </tr>
  <tr>
    <td colspan="2"><p><?php echo $beneficiaryreview['text']; ?></p>
      <?php for ($i = 1; $i <= 5; $i++) { ?>
      <?php if ($beneficiaryreview['rating'] < $i) { ?>
      <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
      <?php } else { ?>
      <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
      <?php } ?>
      <?php } ?></td>
  </tr>
</table>
<?php } ?>
<div class="text-right"><?php echo $pagination; ?></div>
<?php } else { ?>
<p><?php echo $text_no_beneficiaryreviews; ?></p>
<?php } ?>
