<p align="center"> 
  <img src="yeti_jam_logo.png" alt="Yeti Jam Logo" width="120px" height="120px">
</p>
<h1 align="center"> Yeti Jam </h1>
<h3 align="center"> Godot 4.3 - Musical Video Game </h3>
<h5 align="center"> Made in less than 2 days - <a href="https://www.albigamesfestival.fr/">Albi Games Festival</a> (November 2024) </h5>

<p align="center">
    <img src="img/game_presentation.gif">
</p>

<!-- TABLE OF CONTENTS -->
<h2 id="table-of-contents"> :book: Table of Contents </h2>

<details open="open">
    <summary>Table of Contents</summary>
    <ol>
    <li><a href="#about-the-project"> ➤ About The Project</a></li>
    <li><a href="#overview"> ➤ Overview</a></li>
    <li><a href="#install"> ➤ How to install Yeti Jam</a></li>
    <li><a href="#add-your-music"> ➤ How to implement your Music</a></li>
    <li><a href="#credits"> ➤ Credits</a></li>
</ol>
</details>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- ABOUT THE PROJECT -->
<h2 id="about-the-project"> :pencil: About The Project</h2>

<p align="justify"> 
This game was developed in under 48 hours during a game jam at a festival, with the theme rhythm. It was designed for easy adaptation to an arcade cabinet, a requirement set by <a href="https://albilab.fr/">Albilab</a>, who plans to create one for the game in the future.
</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- OVERVIEW -->
<h2 id="overview"> :cloud: Overview</h2>

<p align="justify"> 
  This is a rhythm-based game featuring 3 levels with increasing difficulty. The objective is simple: press the correct key as the notes arrive, similar to Guitar Hero.
</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- INSTALL -->
<h2 id="install"> :question: How to install the game</h2>

<p align="justify"> 
To install the game, simply download the project from my GitHub repository and import it into Godot.
</p>
<img src="img/import.png" alt="Import Button" style="max-width:100%;">
<p align="justify">
</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- ADD YOUR MUSIC -->
<h2 id="add-your-music"> :musical_score: Implement your music</h2>

<p align="justify"> 
The notes in the game appear based on the music timing. To achieve this, I created a <a href="https://github.com/SteelPotathor/Song-Rhythm">Python script</a> that generates a JSON file containing the note timings for each track. Simply input the path to the JSON and the music file (MP3 or WAV) into the Godot script <b>Scripts/Difficulty.gd</b> to customize the game for any song.
</p>
<img src="img/difficulty.png" alt="Specified Code" style="max-width:100%;">
<p align="justify"> 
You can modify each of the 3 levels music! (on_hard_button_pressed = HARD, on_medium_button_pressed = MEDIUM...)
</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- CREDITS -->
<h2 id="credits"> :scroll: Credits</h2>

<p align="justify">AlbiGamesFestival for hosting the jam </p>
<p align="justify">AlbiLab for organizing the jam </p>
<p align="justify">My team for their hard work (credits in-game with roles) </p>

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/SteelPotathor)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/timoth%C3%A9e-da-costa-cantante-01aaa6336/)
