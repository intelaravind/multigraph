#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int nv, ne;

struct v_struct {
        int src, dst;
        int val; // dep
};

int compare1(const void *a, const void *b)
{
        if (((struct v_struct *)a)->src - ((struct v_struct *)b)->src > 0) return 1;
        if (((struct v_struct *)a)->src - ((struct v_struct *)b)->src < 0) return -1;
        return ((struct v_struct *)a)->dst - ((struct v_struct *)b)->dst;
}

int main(int argc, char **argv)
{
        FILE *fp, *fp2, *fp3, *fp4;
        struct v_struct *temp_v;
        int *valid, *loc;
        char buf[300];
        int nflag, sflag;
        int dummy, pre_count=0, tmp_ne;
        int i;

	srand(time(NULL));

        // read "matrix market format"
        fp = fopen(argv[1], "r");
	fp2 = fopen(argv[2], "w");
	fp3 = fopen(argv[3], "w");
	fp4 = fopen(argv[4], "w");
        fgets(buf, 300, fp);
        if(strstr(buf, "symmetric") != NULL) sflag = 1; // symmetric
        else sflag = 0;
        if(strstr(buf, "pattern") != NULL) nflag = 0; // non-value
        else nflag = 1;

#ifdef SYM
sflag = 1;
#endif
#ifdef NSYM
sflag = 0;
#endif

        while(1) {
                pre_count++;
                fgets(buf, 300, fp);
                if(strstr(buf, "%") == NULL) break;
        }
        fclose(fp);

        fp = fopen(argv[1], "r");
        for(i=0;i<pre_count;i++)
                fgets(buf, 300, fp);

        fscanf(fp, "%d %d %d", &nv, &dummy, &ne);
        ne *= (sflag+1);

        temp_v = (struct v_struct *)malloc(sizeof(struct v_struct)*ne);


	int *degree = (int *)malloc(sizeof(int)*nv);
	memset(degree, 0, sizeof(int)*nv);

        for(i=0;i<ne;i++) {
                fscanf(fp, "%d %d", &temp_v[i].src, &temp_v[i].dst);
                temp_v[i].src--; temp_v[i].dst--;

                if(nflag == 0) temp_v[i].val = (rand()%64)+1;
                else {
			float ftemp;
			fscanf(fp, " %f ", &ftemp); //need to be modified
			temp_v[i].val = (int)ftemp;
//printf("((%d))\n", temp_v[i].val);
		}
                if(sflag == 1) {
                        i++;
                        temp_v[i].dst = temp_v[i-1].src;
                        temp_v[i].src = temp_v[i-1].dst;
                        temp_v[i].val = temp_v[i-1].val;

                }
        }
        qsort(temp_v, ne, sizeof(struct v_struct), compare1);

        // remove duplicated edges & vertices not used
        loc = (int *)malloc(sizeof(int)*(ne+1));

        memset(loc, 0, sizeof(int)*(ne+1));
        loc[0]=1;
        for(i=1;i<ne;i++) {
                if(temp_v[i].src == temp_v[i-1].src && temp_v[i].dst == temp_v[i-1].dst)
                        loc[i] = 0;
                else loc[i] = 1;
        }
        for(i=1;i<=ne;i++)
                loc[i] += loc[i-1];
        for(i=ne; i>=1; i--)
                loc[i] = loc[i-1];
        loc[0] = 0;


        for(i=0;i<ne;i++) {
                temp_v[loc[i]].src = temp_v[i].src;
                temp_v[loc[i]].dst = temp_v[i].dst;
                temp_v[loc[i]].val = temp_v[i].val;
        }

        ne = loc[ne];

	for(i=0;i<ne;i++) {
		degree[temp_v[i].src]++;
	}	

	for(i=0;i<ne;i++) {
		fprintf(fp2, "%d\t%d\n", temp_v[i].src, temp_v[i].dst);
		fprintf(fp3, "%d\t%d\t%d\n", temp_v[i].src, temp_v[i].dst, temp_v[i].val);
		fprintf(fp4, "%d\t%d\t%d\n", temp_v[i].src, temp_v[i].dst, degree[temp_v[i].src]);
	}
	fclose(fp); fclose(fp2); fclose(fp3); fclose(fp4);
	free(degree);
        free(temp_v);
        free(loc);
	return(0);
}

