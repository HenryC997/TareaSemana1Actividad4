import 'package:ejcalificacionessemana1/ejcalificacionessemana1.dart'
    as ejcalificacionessemana1;

class Estudiante {
  String nombre;
  List<double> calificaciones;

  Estudiante(this.nombre, this.calificaciones);
}

void main() {
  List<Estudiante> estudiantes = [];

  // Función para agregar un nuevo estudiante
  void agregarEstudiante(String nombre, List<double> calificaciones) {
    estudiantes.add(Estudiante(nombre, calificaciones));
    print('Estudiante $nombre agregado con éxito.');
  }

  // Función para calcular el promedio de un estudiante
  double calcularPromedio(Estudiante estudiante) {
    double suma = 0;
    for (double nota in estudiante.calificaciones) {
      suma += nota;
    }
    return suma / estudiante.calificaciones.length;
  }

  // Función para encontrar la calificación más alta y más baja de una asignatura
  void calificacionesExtremas(
      List<Estudiante> estudiantes, int indiceAsignatura) {
    double maximo = estudiantes[0].calificaciones[indiceAsignatura];
    double minimo = estudiantes[0].calificaciones[indiceAsignatura];
    for (var estudiante in estudiantes) {
      if (estudiante.calificaciones[indiceAsignatura] > maximo) {
        maximo = estudiante.calificaciones[indiceAsignatura];
      }
      if (estudiante.calificaciones[indiceAsignatura] < minimo) {
        minimo = estudiante.calificaciones[indiceAsignatura];
      }
    }
    print('Asignatura $indiceAsignatura: Máxima = $maximo, Mínima = $minimo');
  }

  // Función para mostrar estudiantes con promedio superior a un valor dado
  void estudiantesSobresalientes(double promedioMinimo) {
    for (var estudiante in estudiantes) {
      double promedio = calcularPromedio(estudiante);
      if (promedio > promedioMinimo) {
        print('${estudiante.nombre}: Promedio = $promedio');
      }
    }
  }

  // Función para ordenar estudiantes por promedio
  void ordenarEstudiantes(bool ascendente) {
    estudiantes.sort((a, b) {
      return calcularPromedio(a).compareTo(calcularPromedio(b)) *
          (ascendente ? 1 : -1);
    });
  }

  // Ejemplo de uso:
  agregarEstudiante('Cristian', [8.5, 9.0, 7.5]);
  agregarEstudiante('Henry', [9.5, 10.0, 8.8]);
  agregarEstudiante('Brayan', [7.0, 6.5, 8.0]);

  // Calcular el promedio de Cristian
  print('Promedio de Cristian: ${calcularPromedio(estudiantes[0])}');

  // Calificaciones extremas de la primera asignatura
  calificacionesExtremas(estudiantes, 0);

  // Estudiantes con promedio superior a 8.5
  estudiantesSobresalientes(8.5);

  // Ordenar estudiantes por promedio ascendente
  ordenarEstudiantes(true);
  print('Estudiantes ordenados por promedio ascendente:');
  for (var estudiante in estudiantes) {
    print('${estudiante.nombre}: ${calcularPromedio(estudiante)}');
  }
}
