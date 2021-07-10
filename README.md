<p align="center">
  <!-- <a href="https://github.com/AvishrantsSh/Django-Template">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a> -->

  <h1 align="center">Django Template</h1>

  <p align="center">
    An awesome way to kickstart your Django projects!
    <br>
    <br>
    <a href="https://github.com/AvishrantsSh/Django-Template/issues">Report Bug</a>
    ·
    <a href="https://github.com/AvishrantsSh/Django-Template/issues">Request Feature</a>
  </p>
</p>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]

<br>

<!-- TABLE OF CONTENTS -->

## Table of Contents
<ol>
  <li>
    <a href="#about-the-project">About The Project</a>
  </li>
  <li>
    <a href="#getting-started">Getting Started</a>
    <ul>
      <li><a href="#prerequisites">Prerequisites</a></li>
      <li><a href="#installation">Installation</a></li>
    </ul>
  </li>
  <li><a href="#usage">Usage</a></li>
  <li><a href="#contributing">Contributing</a></li>
  <li><a href="#license">License</a></li>
</ol>



<!-- ABOUT THE PROJECT -->
## About The Project

Managing your Django project and all its dependencies can be a nightmare. This also includes working in virtual environments, securing your `SECRET KEY`, adding files to `.gitignore` etc.

Why not simplify this tedious and repetetive work? 

With this objective in mind, I created `Django Template`, a simple and minimalistic django project template that fits all your requiremenets. 


<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

This project is optimized to run on Linux Environments. Tests for Windows and Mac are still in progress.

### Installation

Simply click on [Use this template](https://github.com/AvishrantsSh/Django-Template/generate) on top to get started. This will make your own django project repository with this directory structure.

Alternatively, you can clone this template repository using
```sh
git clone https://github.com/AvishrantsSh/Django-Template.git
```

After getting a local copy on your system, proceed with the following steps.

1. To build your django project, run
    ```sh
    make project
    ```
    A prompt will ask you to enter a valid project name before continuing.
    Alternatively, you can run the following command
    ```sh
    django-admin startproject --template=./structure ${project-name} .
    ```
    This command will setup your virtual environment, secret keys and all the dependencies required by a django project.

2. Apply Database Migrations
    ```sh
    make migrate
    ```
<!-- USAGE EXAMPLES -->
## Usage

You can use `make` commands to perform various operations on your django project.
1. Start django server on port `8000`
    ```sh
    make run
    ```

2. Apply database migrations
    ```sh
    make migrate
    ```

3. Clear database records.
    ```sh
    make flush
    ```
     _Note:Media files will not be deleted using this command_

4. Update project requirements (useful for deployment)
    ```sh
    make freeze
    ```

5. Check for proper formatting and import style using `black` and `isort`
    ```sh
    make format
    ```

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/AvishrantsSh/Django-Template.svg?style=for-the-badge
[contributors-url]: https://github.com/AvishrantsSh/Django-Template/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/AvishrantsSh/Django-Template.svg?style=for-the-badge
[forks-url]: https://github.com/AvishrantsSh/Django-Template/network/members
[stars-shield]: https://img.shields.io/github/stars/AvishrantsSh/Django-Template.svg?style=for-the-badge
[stars-url]: https://github.com/AvishrantsSh/Django-Template/stargazers
[issues-shield]: https://img.shields.io/github/issues/AvishrantsSh/Django-Template.svg?style=for-the-badge
[issues-url]: https://github.com/AvishrantsSh/Django-Template/issues
[license-shield]: https://img.shields.io/github/license/AvishrantsSh/Django-Template.svg?style=for-the-badge
[license-url]: https://github.com/AvishrantsSh/Django-Template/blob/main/LICENSE
