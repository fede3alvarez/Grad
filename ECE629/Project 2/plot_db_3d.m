function plot_db_3d(net,xmin,xmax,dx,ymin,ymax,dy,zmin,zmax,dz) 
 
xlim([xmin xmax]) 
ylim([ymin ymax]) 
hold on; 
for x=xmin:dx:xmax 
	for y=ymin:dy:ymax 
	    for z=zmin:dz:zmax 
		    activation = net([x; y; z]); 
		    if activation > 0 
		    	plot3(x,y,z,'.r', "markersize", 6);
		    else 
		    	plot3(x,y,z,'.g', "markersize", 6); 
		    end 
		    hold on; 
	    end 
	end 
end 
 
end