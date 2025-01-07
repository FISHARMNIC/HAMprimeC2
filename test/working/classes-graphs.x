/* 
this works, but is currently being rewritten using the new builtin libs
*/

#include sys staticQueue;

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
            this.connections <- LLGraphNode(GraphNode:borrowed:(node));
        }
        else
        {
            this.connections.add_brwd(GraphNode:borrowed:(node));
        }
    }

    .addTwoWayConnection method<GraphNode node>
    {
        this.addConnection(node);
        node.addConnection(this);
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


Graph format
{
    .allNodes LLGraphNode;

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

    .bft method<GraphNode node>
    {
        create queue <- StaticQueue();
        
        queue.push(GraphNode:borrowed:(node));

        node.visited <- 1;

        while(queue.empty() == 0)
        {
            create GraphNode current <- queue.pop();

            create walker <- borrow current.connections;
            while(walker != 0)
            {
                if(walker.node.visited == 0)
                {
                    queue.push(GraphNode:borrowed:(walker.node));
                    walker.node.visited <- 1;
                }
                walker <- borrow walker.next;
            }
        }
    }
    
    .dft method<GraphNode current>
    {
         
        // segfaults 
        /*
        forEach(nodeLL in (this.allNodes))
        {
            nodeLL.node.visited <- 0;
        }
        */
        
        current.visited <- 1;
        print_(current.value);

        create walker <- borrow current.connections;
        while(walker != 0)
        {
            //JS_EVAL "throwE(defines.types.GraphNode.formatPtr.properties[2].type.formatPtr.properties[0].type.formatPtr)";
            //JS_EVAL "throwE(scope[1].data.parameters[0].type.formatPtr.properties[2].type.formatPtr.properties[0].type)"; 
            //print_(`Checking ${walker.node.value}: ${walker.node.visited}`);
            if(walker.node.visited == 0)
            {
                this.dft(walker.node);
            }
            walker <- borrow walker.next;
        }
    }
}

entry function<>
{

    create graph <- Graph();

    /* using this gif: https://miro.medium.com/v2/resize:fit:1248/0*r5blxPoPZaX1OkGr.gif */
    /*
    create node1 <- GraphNode(1);
    create node2 <- GraphNode(2);
    create node3 <- GraphNode(3);
    create node4 <- GraphNode(4);
    create node5 <- GraphNode(5);
    create node6 <- GraphNode(6);
    create node7 <- GraphNode(7);

    node1.addTwoWayConnection(node2);
    node1.addTwoWayConnection(node5);
    node1.addTwoWayConnection(node3);

    node2.addTwoWayConnection(node6);
    node2.addTwoWayConnection(node4);

    node3.addTwoWayConnection(node4);
    node3.addTwoWayConnection(node7);

    node4.addTwoWayConnection(node5);

    graph.dft(node1);
    */
    
    
    // BFT WIP
    // testing with this gif: https://miro.medium.com/v2/resize:fit:1200/1*KAZbkOGxRrmTokzX6af2vA.gif
    
    create node0 <- GraphNode(0);
    create node1 <- GraphNode(1);
    create node2 <- GraphNode(2);
    create node3 <- GraphNode(3);
    create node4 <- GraphNode(4);
    create node5 <- GraphNode(5);

    graph.addNode(node0);
    graph.addNode(node1);
    graph.addNode(node2);
    graph.addNode(node3);
    graph.addNode(node4);
    graph.addNode(node5);

    node0.addConnection(node1);
    node0.addConnection(node2);
    
    node1.addConnection(node2);
    node1.addConnection(node3);

    node2.addConnection(node3);
    
    node3.addConnection(node4);
    
    node4.addConnection(node0);
    node4.addConnection(node1);
    node4.addConnection(node5);

    graph.bft(node0);
    
}