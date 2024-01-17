# FortiGate Get Image in GCP - terraform module

This module helps you find the correct image based on the following search criteria:

- firmware version (var.ver - eg. "7.4.1", no default)
- licensing (var.lic - defaults to payg, allowed values: "payg", "byol")
- architecture (var.arch - defaults to x64, allowed values: "arm", "x64")

If multiple images are matching, the result will point to the latest one.

## Using as part of terraform code

This module can be used to identify the boot image when creating FortiGate VM instances in Google Cloud. Use `module` block to call this module with desired firmware version, licensing and architecture as parameters. Use the module `self_link` output value to indicate the image. See [examples](examples/single-vm/main.tf) for working code.

## Using as a standalone search tool (CLI)

You can use the module to search for the image in command line. Simply run

```
terraform init
terraform plan
```

and provide the version number to get details about the image. 

Licensing defaults to PAYG and architecture to x64. Use `-var` command-line parameters to change them.

### Outputs

- self_link - URI of the image
- image - object with all image attributes

### Note

This module does not support searching by family. See [other examples](https://github.com/40net-cloud/fortinet-gcp-solutions/blob/master/FortiGate/docs/images.md#using-image-family-with-terraform) on how to use image family with terraform.