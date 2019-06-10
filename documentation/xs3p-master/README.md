# xs3p XSD documentation generator

This tool generates nice-looking HTML documentation from XML Schema
Descriptions.

It is a fork of version 1.1.5 of the xs3p doc tool from
http://xml.fiforms.org/xs3p/ - see the [original README](README_ORIG.txt) for
more information.

Added features include:

 - Complete re-design using [Bootstrap](https://getbootstrap.com "Bootstrap homepage")
 - Output of UTF-8 encoded files
 - Output of HTML5
 - Support [Markdown](https://daringfireball.net/projects/markdown/ "Markdown homepage")
   formatting in `<documentation>` elements, powered by the
   [Pagedown library](https://code.google.com/archive/p/pagedown/ "Pagedown homepage")

You can see a nice example result here:

 * https://bitfehler.net/xs3p/address_annotated.xsd.html

which is the result of [one of the
examples](examples/address_annotated.xsd "XSD source of the example")
added specifically to demonstrate the new features of this fork.

Another interesting example is the result for the XML Schema .xsd itself:

 * https://bitfehler.net/xs3p/XMLSchema.xsd.html

That one pushes the system to its limits, but it's still useful in my opinion.

### Known issues

 * There is currently no way to inline the Bootstrap and jQuery sources, thus
   those files must be fetched when viewing the documentation. Their URLs can
   be set, though, so you could serve them locally if offline viewing is a
   requirement.
 * While I even added some features (e.g. linking to the `source` attribute of
   the `<documentation>` element, if present), some features that have
   previously worked may have gone missing. Quite some refactoring was involved
   and it is quite hard to test some of the more esoteric features of XSD.
 * There are some minor display issues, but as far as I can tell none of them
   impact the usability.
