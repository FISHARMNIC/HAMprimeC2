var savedZones = {}

var isHidden = false;

function hide(zone)
{
    if(!isHidden)
    {
    var div = document.getElementById("zone_" + zone)
    var correspondent = document.getElementById("zone_" + zone + "_correspondent")
    var saved = document.getElementById("zone_" + zone + "_ta").value

    savedZones[zone] = {d: div.cloneNode(true), saved}
    div.innerHTML = `<div class="term" style="width:200%;padding:2px;margin-top:5px"><button class="term" style="width:50%" onclick="show('${zone}')">open</button></div>`
    div.style.height = "0%"
    correspondent.style.height = "95%"
    assembly_viewer.setSize("100%", "100%")
    isHidden = true
    }
}

function show(zone)
{
    if(isHidden) {
    var div = document.getElementById("zone_" + zone);
    var correspondent = document.getElementById("zone_" + zone + "_correspondent");
    div.innerHTML = savedZones[zone].d.innerHTML
    var saved = document.getElementById("zone_" + zone + "_ta")
    saved.value = savedZones[zone].saved
    correspondent.style.height = "38%"
    assembly_viewer.setSize("100%", "100%")
    isHidden = false
    // div.scrollTop = 99999999
    }
}

function openFileChooser()
{
    document.getElementById("overlay").hidden = false
    document.getElementById("popup").hidden = false
}

function closeFileChooser()
{
    document.getElementById("overlay").hidden = true
    document.getElementById("popup").hidden = true
}