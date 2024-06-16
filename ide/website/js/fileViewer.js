var files = comms.getFiles()
var fileZone = document.getElementById("zone_files")

var fileZoneOut = ['<ul class="fs" style="width: 100%">']
files.forEach(x => {
    // major security bug right here
    var isFolder = x[x.length - 1] == "/"
    fileZoneOut.push(
        `<li><button class="fs" onclick="comms.${isFolder? "loadFolder" : "loadFile"}('${x}')"><i class="fa ${isFolder? "fa-folder-o" : "fa-file-code-o"}" aria-hidden="true" style="align: left;"></i><span>&nbsp;&nbsp;${x}</span></button></li>`)
})
fileZoneOut.push(`</ul>`)

fileZone.innerHTML = fileZoneOut.join(" ")