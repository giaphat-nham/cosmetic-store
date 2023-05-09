<div class="folder-title-space">
    <?php
    if (isset($_GET['feature'])) {
        $featureName = $conn->loadFeature($_GET['feature']);
        echo "<p class = 'font-weight-bold text-primary'>" . $featureName . "</p>";

    }
    ?>
</div>