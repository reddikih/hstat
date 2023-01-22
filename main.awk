NR == 1 {
    min = $1;
    max = $1;
}
{
    sum+=$1;
    if (min > $1) min = $1;
    if (max < $1) max = $1;
    data[NR] = $1;
}
END {
    mean = sum / NR;
    i=1;
    while (i < NR) {
        sumvar += (data[i] - mean) * (data[i] - mean);
        i++;
    }
    var = sumvar / NR;
    stddev = sqrt(var);

    print "min\tmax\tmean\tvar\tstddev";
    print min "\t" max "\t" mean "\t" var "\t" stddev;
}
