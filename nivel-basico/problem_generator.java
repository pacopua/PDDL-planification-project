import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
//import javafx.util.Pair;

public class RandomPDDLGenerator {

    private static Random random = new Random();

    public static void main(String[] args) {

        int minDias = 1;
        int maxDias = 0;
        while (maxDias < minDias) {
            System.out.println("Elija el numero minimo y maximo de dias\n" + "minimo: ");
            minDias = Integer.parseInt(System.console().readLine());
            System.out.println("maximo: ");
            maxDias = Integer.parseInt(System.console().readLine());

            if(maxDias < minDias){
                System.out.println("El numero maximo de dias no puede ser menor que el minimo");
            }
        }

        //hacemos lo mismo pero con los contenidos
        int minContenidos = 1;
        int maxContenidos = 0;
        while (maxContenidos < minContenidos) {
            System.out.println("Elija el numero minimo y maximo de contenidos\n" + "minimo: ");
            minContenidos = Integer.parseInt(System.console().readLine());
            System.out.println("maximo: ");
            maxContenidos = Integer.parseInt(System.console().readLine());

            if(maxContenidos < minContenidos){
                System.out.println("El numero maximo de contenidos no puede ser menor que el minimo");
            }
        }
        //Pair<Integer, Integer> dia = new Pair<>(minDias, maxDias);
        //Pair<Integer, Integer> contenido = new Pair<>(minContenidos, maxContenidos);
        generarPDDL("random_problem.pddl", minDias, maxDias, minContenidos, maxContenidos);
    }

    public static void generarPDDL(String filename, int minDia, int maxDia, int minContenido, int maxContenido) {
        int numDays = random.ints(minDia, maxDia + 1).findFirst().getAsInt();
        int numContents = random.ints(minContenido, maxContenido + 1).findFirst().getAsInt();

        List<String> contents = generateRandomStrings(numContents, "Content");
        List<String> days = generateRandomStrings(numDays, "Day");

        try (FileWriter file = new FileWriter(filename)) {
            file.write("(define (problem PROBLEMA_NIVELBASICO)\n");
            file.write("    (:domain DOMAIN_NIVELBASICO)\n");
            file.write("    (:objects\n");
            for (String content : contents) {
                file.write("        " + content + " - contenido\n");
            }
            for (String day : days) {
                file.write("        " + day + " - dia\n");
            }
            file.write("    )\n");
            file.write("    (:init\n");
            for (String content : contents) {
                if (random.nextBoolean()) {
                    file.write("        (tienequever " + content + ")\n");
                }
            }
            for (int i = 0; i < numContents - 1; i++) {
                if (random.nextBoolean()) {
                    file.write("        (predecesor " + contents.get(i) + " " + contents.get(i + 1) + ")\n");
                }
            }
            for (String content : contents) {
                file.write("        (not (havisto " + content + "))\n");
                file.write("        (not (agendado " + content + "))\n");
            }
            for (String day : days) {
                file.write("        (not (lleno " + day + "))\n");
            }
            for (String content : contents) {
                if (random.nextBoolean()) {
                    file.write("        (not (predecesoresAgendados " + content + "))\n");
                }
            }
            file.write("    )\n");
            file.write("    (:goal\n");
            file.write("        (and\n");
            for (String content : contents) {
                file.write("            (agendado " + content + ")\n");
            }
            file.write("        )\n");
            file.write("    )\n");
            file.write(")\n");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static List<String> generateRandomStrings(int count, String prefix) {
        List<String> strings = new ArrayList<>();
        for (int i = 1; i <= count; i++) {
            strings.add(prefix + i);
        }
        return strings;
    }
}