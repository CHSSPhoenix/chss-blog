# chss-blog
Frontend project of the blog page of chss community, with purescript.

## Development Environment

To setup a development environment, you'll need to have the following tools installed.

* Node, The latest LTS version should work, additionally, it's recommended to use *NVM* for nodejs instalations.
* Stack, when installing the purescript npm package, purescript binary will be built with stack.

Once you have the requirements in place, you can proceed to clone the project and install the npm
and bower dependencies. For convenience, purescript, pulp and bower were added as devDependencies,
thus avoiding the need to use global npm packages. Since they can be be conflicting when updating
node or npm themselves.

```bash
git clone git@github.com:CHSSPhoenix/chss-blog.git
cd chss-blog
npm install
npm run bower -- install
```

A couple of scripts have been added to facilitate the use of pulp and bower while being local packages.

```bash
npm run pulp -- build    # pulp build
npm run bower -- install # bower install
```