var svg1_5 = d3.selectAll("#v1_5")
var svg2_5 = d3.selectAll("#V2_5")
var svg3_5 = d3.selectAll("#V3_5")
var svg4_5 = d3.selectAll("#V4_5")
var svg5_5 = d3.selectAll("#V5_5")

// Add 3 dots for 0, 50 and 100%
svg1_5.append("circle")
  .attr("cx", 35).attr("cy", 40).attr("r", 30).style("fill", "blue");
svg2_5.append("circle")
  .attr("cx", 35).attr("cy", 40).attr("r", 30).style("fill", "red");
svg3_5.append("circle")
  .attr("cx", 35).attr("cy", 40).attr("r", 30).style("fill", "green");
svg4_5.append("circle")
  .attr("cx", 35).attr("cy", 40).attr("r", 30).style("fill", "yellow");
svg5_5.append("circle")
  .attr("cx", 35).attr("cy", 40).attr("r", 30).style("fill", "orange");

const svg1_2 = d3.querySelectorAll('#v1');
svg1_2.forEach(svg1_2 => {
    svg1_2.append("circle")
        .attr("cx", 35).attr("cy", 40).attr("r", 30).style("fill", "blue");

});