/*This program compute the interaction harmonic potential betwen 2 CG units */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(int argc, char *argv[])
{
  int i, N,j;
  double *residual,p;
  char Converge;
//total=0;
//  N=10;
  /*Read ln file*/
  FILE *fp,*fp2;
  char buff[200];
  fp=fopen("1bw5-newton-500","r");
//fp2=fopen("U_A-B","w");
j=0;
residual=(double *)calloc(1000,sizeof(double));
  while(fgets(buff,200,fp)!=NULL){
       sscanf(buff,"%lf",residual+j);
//       fprintf(stdout,"%.16f\n",residual);
//       p=residual[1]-residual[0];
      j++;
  }
fclose(fp);   
    
       for(i=0;i<j;i++){
             p=sqrt((residual[i+1]-residual[i])*(residual[i+1]-residual[i]));
//             fprintf(stdout,"i+1=%d p=%lf\n",i+1, p); 
             if(p<0.0001)
                  fprintf(stdout,"i=:%d,residual=%.16f,p=%.16f\n",i+1,residual[i+1],p); 
              else
                 continue; 
       }    
  return 0;
}

