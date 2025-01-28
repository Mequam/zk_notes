---
id: 9lax9v93y38tulk358rzsa
title: angular
desc: ''
updated: 1736458943
created: 1736458943
---
# angular

## About

angular is an open source web framework created and maintained
by google, it uses a component based methodology for creating single
page web applications that can be provided with static hosting


## Creating A New Project

```bash
ng new <project name>
```

---

## Generatin' Stuff

angular provides a cli that can be used to manage
and generate angular applications, most generation commands
sart with "ng generate" followed by the type of resource you
want to generate, try the following command for more info

```bash
ng generate help
```


### Generating Components

```bash
ng generate component
```

creates a new angular component that can be used elsewhere in the
    this.htt
application

---

## Environments

angular is a spa application, so there is a static page for the compiled code, but there is often times
when you want different builds to use different environments for wherever they will be deployed (dev verses prod)
you can use the environment settings in angular.json for this

basically you import environments.ts, and then change that file depending on what version of the build you are wanting to run,
that way you don't need to change everyfile inside of the build system

### JSON configuration

the following snippit is taken from [angular env](https://medium.com/@philip.mutua/setting-up-environment-variables-for-an-angular-application-from-scratch-737028f8b7b3) and contains example json code that does this replacement

```json
"configurations": {
  "production": {
    "fileReplacements": [
      {
        "replace": "src/environments/environment.ts",
        "with": "src/environments/environment.prod.ts"
      }
    ],
    "optimization": true,
    "outputHashing": "all",
    "sourceMap": false,
    "extractCss": true,
    "namedChunks": false,
    "aot": true,
    "extractLicenses": true
  },
  "staging": {
    "fileReplacements": [
      {
        "replace": "src/environments/environment.ts",
        "with": "src/environments/environment.staging.ts"
      }
    ],
    "optimization": true,
    "outputHashing": "all",
    "sourceMap": false,
    "extractCss": true,
    "namedChunks": false,
    "aot": true,
    "extractLicenses": true
  },
"uat": {
    "fileReplacements": [
      {
        "replace": "src/environments/environment.ts",
        "with": "src/environments/environment.uat.ts"
      }
    ],
    "optimization": true,
    "outputHashing": "all",
    "sourceMap": false,
    "extractCss": true,
    "namedChunks": false,
    "aot": true,
    "extractLicenses": true
  },
"pilot": {
    "fileReplacements": [
      {
        "replace": "src/environments/environment.ts",
        "with": "src/environments/environment.staging.ts"
      }
    ],
    "optimization": true,
    "outputHashing": "all",
    "sourceMap": false,
    "extractCss": true,
    "namedChunks": false,
    "aot": true,
    "extractLicenses": true
  },
"development": {
    "fileReplacements": [
      {
        "replace": "src/environments/environment.ts",
        "with": "src/environments/environment.development.ts"
      }
    ],
    "optimization": false,
    "sourceMap": false,
    "extractCss": true,
    "namedChunks": false
  }
}
```


### Initial Environment Configuration

you can generate environments initially using the command

```bash
ng generate environments
```

which will create the different sections for you
