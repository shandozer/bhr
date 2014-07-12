var page = require('webpage').create(),
    system = require('system'),
    address, output, size;


    address = system.args[1];
    output = system.args[2];
    page.viewportSize = { width: 1080, height: 600 };
    
    page.paperSize = { format: 'Letter', orientation: 'portrait', margin: '1cm' };
    
    page.open(address, function (status) {
        if (status !== 'success') {
            console.log('Unable to load the address!');
            phantom.exit();
        } else {
            window.setTimeout(function () {
                page.render(output);
                phantom.exit();
            }, 10000);
        }
    });
