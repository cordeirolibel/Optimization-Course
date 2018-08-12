%% procedure LOCAL to make a refinement arounf best point
%%% Local algorithm applied only to the best point
function [point_best, Fobj_best,count_Fobj]=local_to_best(point_best, Fobj_best, N, Upper, Lower, count_Fobj, maxiter_local,delta,compute_obj)

    length_local=delta*max(Upper-Lower); 
  
    for k=1: 1.0: N     % for all dimensions 
         iter_local=1;
         lambda1=rand(1);
         flag=1;
         while (iter_local < maxiter_local) 
           trial_best=point_best; 
           lambda2=rand(1);
           
           if (lambda1>0.5) 
               if (trial_best(k)+lambda2*length_local < Upper(k))	
                    trial_best(k)=trial_best(k)+lambda2*length_local;
               else
                   flag=0;
               end
           else  
               if (trial_best(k)-lambda2*length_local>Lower(k))	
                    trial_best(k)=trial_best(k)-lambda2*length_local;
               else
                   flag=0;               
               end
           end
           
           if (flag==1)
                   F_trial=compute_obj(trial_best);   
                   count_Fobj = count_Fobj + 1;
              
                   %%% selection mechanism - test trial e best          
                   if (F_trial < Fobj_best)  % if f(trial)<f(best) then best <- trial
                      point_best = trial_best;
                      Fobj_best = F_trial;
                   else
                     iter_local=maxiter_local -1;
                   end
                   %end of selection mechanism //////////////
           end         
           iter_local=iter_local+1;
         end %end while
    end %end for
end