<?php
$this->title = G::t ( 'Confirm deletion' );

$this->breadcrumbs = array (
		G::t ( 'Delete account' ) 
);

printf ( '<h2>%s</h2>', G::t ( 'Are you really sure you want to delete your Account?' ) );

printf ( '<p>%s</p>', G::t ( 'Please enter your password to confirm deletion:' ) );

echo CHtml::form ( array (
		'delete' 
) );
echo CHtml::passwordField ( 'confirmPassword' ) . "<br />";
echo CHtml::linkButton ( G::t ( 'Cancel deletion' ), array (
		'submit' => array (
				'profile' 
		) 
) );
echo CHtml::submitButton ( G::t ( 'Confirm deletion' ) );
echo CHtml::endForm ();
?>
