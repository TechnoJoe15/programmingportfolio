#ifndef PYRAMID_H
#define PYRAMID_H
#include <string>
#include <cmath>
using namespace std;

class Pyramid {
private:
    float S;
    float H;
    float SL;
    const double pi = 3.14159265358979323846;
public:
    // Constructor
    Pyramid(float S, float H, float SL){
        this->S = S;
        this->H = H;
        this->SL = SL;
    }

    // Methods
    float getV(){
        float ap = (SL)/(2*(tan(pi/S)));
        float ba = (S*SL*ap)/2;
        float vol = (ba*H)/3;
        return vol;
    }
    float getSA(){
        float ap = (SL)/(2*(tan(pi/S)));
        float ba = (S*SL*ap)/2;
        float slanth = sqrt(pow(ap,2)+pow(H,2));
        float surf = (((S*SL)*slanth)/2)+ba;
        return surf;
    }
};

#endif