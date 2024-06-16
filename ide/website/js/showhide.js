var savedZones = {}

function hide(zone)
{
    var div = document.getElementById("zone_" + zone);
    var correspondent = document.getElementById("zone_" + zone + "_correspondent");
    var saved = document.getElementById("zone_" + zone + "_ta").value

    savedZones[zone] = {d: div.cloneNode(true), saved}
    div.innerHTML = `<button onclick="show('${zone}')">open</button>`
    div.style.height = "0%"
        correspondent.style.height = "90%"
    assembly_viewer.setSize("100%", "100%");
}

function show(zone)
{
    var div = document.getElementById("zone_" + zone);
    var correspondent = document.getElementById("zone_" + zone + "_correspondent");
    div.innerHTML = savedZones[zone].d.innerHTML;
    var saved = document.getElementById("zone_" + zone + "_ta")
    saved.value = savedZones[zone].saved
    correspondent.style.height = "38%"
    assembly_viewer.setSize("100%", "100%");

}