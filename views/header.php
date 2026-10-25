<?php
// Shared page header. Expects $pageTitle. Shows the one-time flash message.
$flash = pullFlash();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= e($pageTitle ?? 'Game Studio Registry') ?></title>
    <link rel="stylesheet" href="assets/style.css">
</head>
<body>
<header class="topbar">
    <a href="index.php" class="brand">🎮 Game Studio Registry <span>One studio, many games</span></a>
</header>
<main>
<?php if ($flash): ?>
    <div class="flash <?= e($flash['type']) ?>" role="alert"><?= e($flash['message']) ?></div>
<?php endif; ?>
