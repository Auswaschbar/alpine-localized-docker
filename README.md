# alpine-localized-docker

Adding locales to an alpine container in a single easy step.

## Building an image

Build a test image named alpine-localized with

```sh
docker build -t alpine-localized .
```

Test if locales work with

```sh
docker run alpine-localized sh -c 'date && LC_ALL=de_DE.UTF-8 date'
```

## Incorporating the image into your container

Either use this image as a base, or copy the two steps from this dockerfile into your own.

## Using locales

- Set the environment variables LC\_... to your favorite locale.
- in C(++), using `newlocale()` also works
- either way, as of now, musl requires you to use the full locale name like _de_DE.UTF-8_. Using just _de_DE_ doesn't seem to work

## Creating or modifying locales

Per default, locales are maintained and pulled from https://gitlab.com/rilian-la-te/musl-locales.
Currently, the selection of locales is very limited and incomplete, but you are welcome to create your own.
To do so, clone that repository, modify the existing .po files or create a new one.

Then, you can:

- test your new creations by changing the repository address inside the Dockerfile to your own clone
- make a merge request upstream

# Credits

Konstantin from https://gitlab.com/rilian-la-te/musl-locales for the locale program.
