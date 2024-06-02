<?php require_once('controllers/admin/c_AdminPageArtist.php') ?>
<?php $title = "Virtuose - Page Artiste"; ?>

<?php ob_start(); ?>

<?php $ControllerAdminPageArtist = new AdminPageArtist ?>

<main>
    <?php $ControllerAdminPageArtist->printArtistName() ?>
    <form method="POST" action="index.php">
            <input type="hidden" name="action" value="adminRedirection" >
            <input type="hidden" name="step" value="pageGroup" >
            <input type="hidden" name="groupId" value="<?php echo $ControllerAdminPageArtist->selectGroupArtist; ?>">
            <button type="submit">Retour</button>
    </form>
    <div class="lineAdmin"></div>
    <div class="divAdminOption" id="divArtist">
        <h2>Instruments</h2>
        <table>
            <thead>
                <tr>
                    <th>Nom</th>
                    <th>Poids</th>
                    <th>Volume</th>
                </tr>
            </thead>
            <tbody>
                <?php $ControllerAdminPageArtist->printInstrument(); ?>
            </tbody>
        </table>
        <input class="btnNotClicked btnAdminOption btnAdd" type="button" value="Ajouter" name="addInstrument" onclick="adminClickEvent(this)" />
    </div>
    
    <div class="divInvisible divAdminOption" id="addInstrument">
        <h1 class="h1_interne">Ajouter un instrument</h1>
        <?php $ControllerAdminPageArtist->printAddInstrument(); ?>
        <form method="POST" action="index.php">
            <input type="hidden" name="action" value="adminRedirection" >
            <input type="hidden" name="step" value="pageArtist" >
            <input type="hidden" name="artistId" value="<?php echo $ControllerAdminPageArtist->selectIdArtist; ?>">
            <button type="submit">Annuler</button>
        </form>
    </div>
</main>

<?php $content = ob_get_clean(); ?>
<?php require('view/layout.php') ?>