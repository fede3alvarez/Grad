function plot_db(net,xmin,xmax,dx,ymin,ymax,dy) 
 
xlim([xmin xmax]) 
ylim([ymin ymax]) 
hold on; 
for x=xmin:dx:xmax 
	for y=ymin:dy:ymax 
		activation = net([x; y]); 
		if activation > 0 
			plot(x,y,'.r', "markersize", 12) 
		else 
			plot(x,y,'.g', "markersize", 12) 
		end 
		hold on; 
	end 
end 
 
end