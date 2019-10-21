clc;clear;

max_gen = 200;
runs = 30;

% answer for step3
results = zeros(runs, 1);
generation_fitness_one = zeros(max_gen, runs);
generation_fitness_two = zeros(max_gen, runs);
%selected generation
selected_generation_one = 3;
selected_generation_two = 5;
for i = 1:runs
    [r,s] = algorithm1();
    results(i) = r(end, 3);
    generation_fitness_one(:,i) = s(:,selected_generation_one);
    generation_fitness_two(:,i) = s(:,selected_generation_two);
end

fprintf('mean value:%f, std:%f\n', mean(results), std(results));

% part answer for step4
[r,s] = algorithm1();
total_gen = size(r, 1);
fitness_of_each_gen = r(:, end);
z = rand(100,25);
figure(1);
subplot(2,1,1);
boxplot(s);
title('The Best Group in Each Generation')
xlabel('The Number of Generation');
ylabel('The fitness');

subplot(2,1,2);
semilogy(1:total_gen, fitness_of_each_gen);
title('The Best Fitness in Each Generation')
xlabel('The Number of Generation');
ylabel('The fitness');

%answer for step 5
figure(2);
subplot(2,1,1);
boxplot(generation_fitness_one);
title(['Generation ',num2str(selected_generation_one)]);
subplot(2,1,2);
boxplot(generation_fitness_two);
title(['Generation  ',num2str(selected_generation_two)]);