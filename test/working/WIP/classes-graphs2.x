/* add thing that wanrs if alr included */

#include sys staticQueue;
#include sys dynamicLL;

GraphNode format
{
    .visited  u32;
    .value u32;

    .connections StaticLL;

    .GraphNode constructor<u32 value>
    {
        this.value <- v;
        this.visited <- 0;
        this.connections <- StaticLL();
    }

    .addConnection method<GraphNode node>;
    {
        this.connections.push(GraphNode:borrowed:(node));
    }

    .addTwoWayConnection method<GraphNode node>
    {
        this.addConnection(node);
        node.addConnection(this);
    }
}

Graph format
{
    .allNodes DynamicLL;

    .Graph constructor<>
    {
        this.allNodes <- DynamicLL();
    }

    .addNode method<GraphNode node>
    {
        this.allNodes.push(node);
    }
}

entry function<>
{

}