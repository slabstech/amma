#include <iostream>
//#include "StopWatch.h"
#include <sstream>
#include <string>
#include <fstream>
#include <vector>
#include <math.h>

struct Point{
	float x,y;
};

using namespace std;

int main(int argc, char **argv)
{

//	StopWatch stopWatch;
//	stopWatch.start();


	cout << "Running Task4 to find shortest path in Polygon Maps" << endl;

	if(argc !=2)
	{
		cout << "Input file not found" << endl ;
		exit(1);
	}

	string input_file_name = argv[1];

	cout << "Processing input file : " << input_file_name << endl;
	std::ifstream infile(input_file_name);
	string line;

	std::getline(infile, line);
	std::istringstream iss(line);


    Point start;
    iss >> start.x ;
    iss >> start.y ;

    std::getline(infile, line);
    std::istringstream isse(line);


    Point end;
    isse >> end.x ;
    isse >> end.y ;


    vector<vector<Point>> polygons;

    std::getline(infile, line); // empty line


    vector<Point> temp_point;
	while (std::getline(infile, line))
	{
	    std::istringstream iss(line);

	    if(line == "")
	    {
	    	polygons.push_back(temp_point) ;
	    	temp_point.clear();
	    }
	    else
	    {
	    	Point temp;
	    	iss >> temp.x ;
	    	iss >> temp.y ;

		    temp_point.push_back(temp);

	    }
	}

	cout << "total number of polygons : " << polygons.size() << endl;

	double distance = sqrt( pow((end.x - start.x),2) +  pow(( end.y - start.y),2)) ;

	cout << "Shortest possible distance(Ignoring Obstacles): " << distance << endl ;


	for(int i=0;i< polygons.size();i++){
		temp_point = polygons.at(i);
		for(int j=0;j< temp_point.size();j++){
			Point temp = temp_point.at(j);

			//cout << temp.x << " " << temp.y << endl;
		}

		//cout << "\n" ;
	}


	ofstream vis_graph_file;

	remove( "points.txt" );
	vis_graph_file.open ("points.txt",  ios::out | ios::app);


	vector<Point> vis_graph_points;


	for(int i=0;i< polygons.size();i++){
			temp_point = polygons.at(i);  // Each polygon
			for(int j=0;j< temp_point.size();j++){
				Point temp = temp_point.at(j);

				vis_graph_points.push_back(start);
				vis_graph_points.push_back(temp);

				/*

				for(int k=0 ; k < temp_point.size() ; k++ ){
					Point next_point = temp_point.at(k);
					vis_graph_points.push_back(next_point);

					//vis_graph_file << "\n" ;
				}
*/
				//vis_graph_file << "\n" ;
			}

			//vis_graph_file << "\n" ;
		}



			for(int i=0;i< polygons.size();i++){
					temp_point = polygons.at(i);  // Each polygon
					for(int j=0;j< temp_point.size();j++){
						Point temp = temp_point.at(j);

						vis_graph_points.push_back(temp);
						vis_graph_points.push_back(end);


/*
						for(int k=0 ; k < temp_point.size() ; k++ ){
							Point next_point = temp_point.at(k);
							vis_graph_points.push_back(next_point);

							//vis_graph_file << "\n" ;
						}
*/
						//vis_graph_file << "\n" ;
					}

					//vis_graph_file << "\n" ;
				}


for(int i=0; i< vis_graph_points.size(); i++){
	Point vis_points = vis_graph_points.at(i);

	 vis_graph_file << vis_points.x << " " << vis_points.y << endl;
}



	vis_graph_file.close();


//	double time = stopWatch.elapsedTime();

	//cout << "Total Execution Time : " << time << endl;

	return 0;
}
