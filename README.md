## Welcome to the official documentation for DMHub!

# How to Use

First off, this documentation uses the [Just the Docs] template for Jekyll. If you're unfamiliar with Jekyll and static site generation, it is **strongly recommended** that you first go to [their website] to learn more about it.

Next, once you have a local copy of the repo, you will be working out of two folders in the root directory: `assets\` and `docs\`.

`assets\` is self explanatory, and will contain any images or other such media you may add. `docs\` contains all of our documentation, sorted by category and subcategory:

- Basics: For basic operations like keyboard shortcuts.
- Tutorials: For guides on specific, popular processes handled by DMHub, i.e. "How to make Perfect Stairs".
- Players & DMs: A comprehensive high-level section for various parts of DMHub. For players and DMs.
- Building in DMHub: Pertaining to map editing, high-level compendium work, and asset creation. For artists, writers, and media content creators.
- Development: Pertaining to DMHub's interface customization and API. For modders and programmers.
- Resources: Help, FAQs, tools, links, et cetera.

Note that files in each folder have a specific naming scheme to keep things tidy. 


## Publishing your site on GitHub Pages

1.  If your created site is `YOUR-USERNAME/YOUR-SITE-NAME`, update `_config.yml` to:

    ```yaml
    title: YOUR TITLE
    description: YOUR DESCRIPTION
    theme: just-the-docs

    url: https://YOUR-USERNAME.github.io/YOUR-SITE-NAME

    aux_links: # remove if you don't want this link to appear on your pages
      Template Repository: https://github.com/YOUR-USERNAME/YOUR-SITE-NAME
    ```

2.  Push your updated `_config.yml` to your site on GitHub.

3.  In your newly created repo on GitHub:
    - go to the `Settings` tab -> `Pages` -> `Build and deployment`, then select `Source`: `GitHub Actions`.
    - if there were any failed Actions, go to the `Actions` tab and click on `Re-run jobs`.

## Building and previewing your site locally

Assuming [Jekyll] and [Bundler] are installed on your computer:

1.  Change your working directory to the root directory of your site.

2.  Run `bundle install`.

3.  Run `bundle exec jekyll serve` to build your site and preview it at `localhost:4000`.

    The built site is stored in the directory `_site`.

**NOTE:** If you modify `_config.yml` for any reason, you may need to rebuild the site manually before your changes will take effect.

## Publishing your built site on a different platform

Just upload all the files in the directory `_site`.

## Licensing and Attribution

This repository is licensed under the [MIT License]. You are generally free to reuse or extend upon this code as you see fit; just include the original copy of the license (which is preserved when you "make a template"). While it's not necessary, we'd love to hear from you if you do use this template, and how we can improve it for future use!

The deployment GitHub Actions workflow is heavily based on GitHub's mixed-party [starter workflows]. A copy of their MIT License is available in [actions/starter-workflows].

----

[^1]: [It can take up to 10 minutes for changes to your site to publish after you push the changes to GitHub](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/creating-a-github-pages-site-with-jekyll#creating-your-site).

[Jekyll]: https://jekyllrb.com
[Just the Docs]: https://just-the-docs.github.io/just-the-docs/
[GitHub Pages]: https://docs.github.com/en/pages
[GitHub Pages / Actions workflow]: https://github.blog/changelog/2022-07-27-github-pages-custom-github-actions-workflows-beta/
[Bundler]: https://bundler.io
[`jekyll-default-layout`]: https://github.com/benbalter/jekyll-default-layout
[`jekyll-seo-tag`]: https://jekyll.github.io/jekyll-seo-tag
[MIT License]: https://en.wikipedia.org/wiki/MIT_License
[starter workflows]: https://github.com/actions/starter-workflows/blob/main/pages/jekyll.yml
[actions/starter-workflows]: https://github.com/actions/starter-workflows/blob/main/LICENSE
[their website]: https://jekyllrb.com/docs/ 
