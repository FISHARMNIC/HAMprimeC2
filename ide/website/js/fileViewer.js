function renderFiles() {
        var files = comms.getFiles()
        var fileZone = document.getElementById("zone_files")
        var dirName = comms.getDir()

        var fileZoneOut = [
            '<ul class="fs" style="width: 100%">',
            `<li><p style="text-align:center;margin:5px;color:white">${dirName.slice(dirName.lastIndexOf("/"))}</p></li>`
        ]
        files.forEach(x => {
            // major security bug right here
            var isFolder = x[x.length - 1] == "/"
            fileZoneOut.push(
                `<li><button class="fs" id="__button_${x}__" onclick="comms.${isFolder ? "loadFolder" : "loadFile"}('${x}')"><i class="far ${isFolder ? "fa-folder" : "fa-file-code"}" aria-hidden="true" style="align: left;"></i><span style="text-overflow: ellipsis ellipsis;">&nbsp;&nbsp;${x}</span></button></li>`)
        })
        fileZoneOut.push(
            `<li><button class="fs" style="text-align: center" onclick="newFile()">+</button></li>`,
            `</ul>`)

        fileZone.innerHTML = fileZoneOut.join(" ")

    }

    function newFile() {
        var nfname = window.prompt("New file name?")
        if (nfname != null) {
            comms.createFile(nfname)
        }
    }

    function openDir(d)
    {
        var out = comms.setDir(d)
        if(out.includes("ERR"))
        {
            window.alert("Unable to use directory")
        }
        else
        {
        closeFileChooser()
        renderFiles()
        }
    }