//
// Network configuration file for the reference network. 
// For communication via WLAN and in a MANET the 
// IPv4NetworkConfigurator, ChannelControl and the AdhocHost 
// class are included.
//

package inet.examples.references.smallNetwork;

import inet.networklayer.autorouting.ipv4.IPv4NetworkConfigurator;
import inet.nodes.inet.AdhocHost;
import inet.world.radio.ChannelControl;


//
// Reference network for simulations. Contains
// mobile nodes and two paired nodes. All nodes are moving
// and are scattered randomly on the map.
//
network AODV_SmallReferenceNetwork
{
    parameters:
        int numNodes;
        int numOriginator;
        int numDestination;
    submodules:
        originator[numOriginator]: AdhocHost {
            @display("p=138,270");
        }
        destination[numDestination]: AdhocHost {
            @display("p=138,180");
        }
        node[numNodes]: AdhocHost {
            @display("i=device/pocketpc_s;r=,,#707070;p=296,114");
        }
        channelControl: ChannelControl {
            parameters:
                @display("p=60,50;i=misc/sun");
        }
        configurator: IPv4NetworkConfigurator {
            parameters:
                config = xml("<config><interface hosts='*' address='145.236.x.x' netmask='255.255.0.0'/></config>");
                @display("p=140,50;i=block/cogwheel_s");
        }
    connections allowunconnected:
}


