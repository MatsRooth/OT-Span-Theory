
define span0  [..] -> x || l1(N) _ r1(N),,
              [..] -> {<} || l1(N) _ r0(N),,
              [..] -> {>} || l0(N) _ r1(N),,
              [..] -> { } || l0(N) _ r0(N);

define span1  span0 .o. cleanup;

