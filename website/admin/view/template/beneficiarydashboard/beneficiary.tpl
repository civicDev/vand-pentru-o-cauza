<style type="text/css">
/* Tiles */
.beneficiary-tile {
	margin-bottom: 15px;
	border-radius: 3px;
	background-color: #2CCA6D;
	color: #FFFFFF;
	transition: all 1s;
}
.beneficiary-tile:hover {
	opacity: 0.95;
}

.beneficiary-tile a {
	color: #FFFFFF;
}
.beneficiary-tile-heading {
	padding: 5px 8px;
	text-transform: uppercase;
	background-color: #1EBD60;
	color: #FFF;
}
.beneficiary-tile .beneficiary-tile-heading .pull-right {
	transition: all 1s;
	opacity: 0.7;
}
.beneficiary-tile:hover .beneficiary-tile-heading .pull-right {
	opacity: 1;
}
.beneficiary-tile-body {
	padding: 15px;
	color: #FFFFFF;
	line-height: 48px;
}
.beneficiary-tile .beneficiary-tile-body i {
	font-size: 50px;
	opacity: 0.3;
	transition: all 1s;
}
.beneficiary-tile:hover .beneficiary-tile-body i {
	color: #FFFFFF;
	opacity: 1;
}
.beneficiary-tile .beneficiary-tile-body h2 {
	font-size: 42px;
}
.beneficiary-tile-footer {
	padding: 5px 8px;
	background-color: #43D680;
}
 </style>

<div class="beneficiary-tile">
  <div class="beneficiary-tile-heading"><?php echo $heading_title; ?> <span class="pull-right">
    <?php if ($percentage > 0) { ?>
    <i class="fa fa-caret-up"></i>
    <?php } elseif ($percentage < 0) { ?>
    <i class="fa fa-caret-down"></i>
    <?php } ?>
    <?php echo $percentage; ?>%</span></div>
  <div class="beneficiary-tile-body"><i class="fa fa-user"></i>
    <h2 class="pull-right"><?php echo $total; ?></h2>
  </div>
  <div class="beneficiary-tile-footer"><a href="<?php echo $beneficiary; ?>"><?php echo $text_view; ?></a></div>
</div>
