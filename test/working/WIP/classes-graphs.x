forward GraphNode format;

/* temp solution until I implement forward methods */
LLGraphNode format
{
    .node GraphNode;
    .next LLGraphNode;

    forward .LLGraphNode constructor<GraphNode node>;
    forward .LLGraphNode constructor<GraphNode:borrowed node>;
    
    forward .findLast method<> -> LLGraphNode:borrowed;
    forward .add method<GraphNode node> -> LLGraphNode:borrowed;
    forward .add_brwd method<GraphNode:borrowed node> -> LLGraphNode:borrowed
}

GraphNode format
{
    .distance u32;
    .visited  u32;

    .connections LLGraphNode;
   
    .value u32;

    .GraphNode constructor<u32 v>
    {
        this.value <- v;
        this.visited <- 0;
        this.connections <- LLGraphNode:(0);
    }
    
    .addConnection method<GraphNode node>
    {
        if(this.connections == 0)
        {
            //print_(`NEW from ${this.value} to ${node.value}`);
            this.connections <- LLGraphNode(GraphNode:borrowed:(node));
        }
        else
        {
            //print_(`SEC from ${this.value} to ${node.value}`);
            //printf("\t%p\n", this.connections);
            this.connections.add_brwd(GraphNode:borrowed:(node));
        }
    }
}

LLGraphNode format
{
    .node GraphNode;
    .next LLGraphNode;

    .LLGraphNode constructor supports (
        <GraphNode node>,
        <GraphNode:borrowed node>
    )
    {
        this.node <- node;
        this.next <- LLGraphNode:(0);
    }
    
    .LLGraphNode operator(index_get)<u32 index> -> GraphNode:borrowed
    {
        create i <- 0;
        
        create walker <- borrow this;
        while(walker != 0)
        {
            if(i == index)
            {
                return(borrow walker.node);
            }
             
            walker <- borrow walker.next;
            i <- i + 1;
        }
        print_(`Fatal error: Index ${index} does not exist!`);
        quit(1);
    }

    .findLast method<> -> LLGraphNode:borrowed
    {
        create walker <- borrow this;

        if(walker == 0)
        {
            print_(`Error!`);
            quit(0);
        }
        
        while(walker.next != 0)
        {
            walker <- borrow walker.next;
        }

        return walker;
    }
    
    .add method<GraphNode node>
    {

        create last <- this.findLast();
        last.next <- LLGraphNode(node);
        
        /* omg why does this not throw Error! node is not an LLGraphNode: last.next <- node; */

    }
    
    /* TODO implement method overloads and make this supportive!!! */
    .add_brwd method<GraphNode:borrowed node>
    {
        create last <- this.findLast();
        last.next <- LLGraphNode(node);
    }
    
    .printAll method<>
    {
        create walker <- borrow this;
        printf("%p\n", walker);
        while(walker != 0)
        {
            print_(walker.node.value);
            walker <- borrow walker.next;
        }
    }
}

Queue format
{

}



Graph format
{
    .allNodes LLGraphNode;
    .queue    Queue;

    .Graph constructor<>
    {
    }

    .addNode method<GraphNode node>
    {
        if(this.allNodes == 0)
        {
            this.allNodes <- LLGraphNode(node);
        }
        else
        {
            this.allNodes.add(node);
        }
    }

    .bft method<>
    {
        /* queue is of type GraphNode*/

        create startNode <- borrow this.allNodes.node;

        this.queue.push(startNode);
        startNode.visited <- 0;

        while(this.queue.size != 0)
        {
            create current <- this.queue.pop();
            print_(current.value);
            
            create walker <- borrow current.connections;
            while(walker != 0)
            {
                if(walker.visited == 0)
                {
                    this.queue.push(walker);
                }
                walker <- borrow walker.next;
            }
        }
    }
}

entry function<>
{
    /* testing with this gif: https://miro.medium.com/v2/resize:fit:1200/1*KAZbkOGxRrmTokzX6af2vA.gif */
    create graph <- Graph();

    create node0 <- GraphNode(0);
    create node1 <- GraphNode(1);
    create node2 <- GraphNode(2);
    create node3 <- GraphNode(3);
    create node4 <- GraphNode(4);
    create node5 <- GraphNode(5);

    //printf("--%p--\n\t%p\n\t%p\n\t%p\n\t%p\n\n", graph.allNodes, node0.connections,node1.connections,node2.connections,node3.connections);
    
    graph.addNode(node0);
    graph.addNode(node1);
    graph.addNode(node2);
    graph.addNode(node3);
    graph.addNode(node4);
    graph.addNode(node5);

    //__rc_collect__();

    //printf("--%p--\n\t%p\n\t%p\n\t%p\n\t%p\n\n", graph.allNodes, node0.connections,node1.connections,node2.connections,node3.connections);
    
    //print_("NODE 0:");
    node0.addConnection(node1);
    node0.addConnection(node2);
    
    //print_("NODE 1:");
    node1.addConnection(node2);
    node1.addConnection(node3);

    node2.addConnection(node3);
    
    node3.addConnection(node4);
    
    node4.addConnection(node0);
    node4.addConnection(node1);
    node4.addConnection(node5);
    
    //graph.allNodes.printAll();

    //JS_EVAL "console.log(userFormats)"
}