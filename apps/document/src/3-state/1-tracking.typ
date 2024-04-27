Im Kontext der Augmented Reality spielt das Tracking eine zentrale Rolle. Tracking, oder das Verfolgen von Objekten, bezieht sich auf die Technologien und Methoden, die verwendet werden, um die Position und Orientierung von Objekten in Echtzeit zu bestimmen. Dies kann sowohl reale als auch virtuelle Objekte umfassen. Das Ziel des Trackings in der AR ist es, eine nahtlose Interaktion zwischen der realen Welt und digital ergänzten Inhalten zu gewährleisten.

Für eine effektive AR-Anwendung muss das System in der Lage sein, die Bewegungen des Benutzers und der Umgebung präzise zu erfassen und die virtuellen Objekte entsprechend anzupassen, um eine kohärente und immersivere Erfahrung zu bieten. Dies umfasst das Erkennen und Verfolgen von räumlichen Referenzpunkten, Gesichtern, Gesten oder speziellen Markern.

In diesem Kapitel werden wir die verschiedenen Tracking-Technologien und -Methoden untersuchen, die in modernen AR-Systemen zum Einsatz kommen. Dazu gehören optisches Tracking, sensorbasiertes Tracking und hybride Ansätze, die mehrere Sensordaten kombinieren, um eine höhere Genauigkeit und Robustheit in verschiedenen Umgebungen zu erreichen. Der Fokus liegt auf Technologien und Methoden, welche für das verständnis von WebXR relevant sind. Es findet keine allgemeine Betrachtung aller Tracking-Verfahren statt, sondern eine Auswahl relevanter Methoden.

=== Transformation
Tracking versucht das Grundproblem von Augmented Reality zu lösen. Die verschmelzung der virtuellen und realen Welt.

Zunächst ist die Definition der relevanten Koordinatensysteme erforderlich. Es gibt das Koordinatensystem des AR-Geräts, beispielsweise eines Smartphones oder einer AR-Brille, sowie das globale Koordinatensystem, das die physische Umgebung abbildet. Die Position des Augmented Reality Gerätes im globalen Koordinatensystem wird durch eine Rotationsmatrix $R_"ba"$ und einen Translationsvektor $b_a$ beschrieben. Die gewünschte Position eines virtuellen Objekts wird relativ zum AR-Gerät definiert. Um die tatsächliche Position des virtuellen Objekts im globalen Koordinatensystem zu berechnen, wird die relative Position des Objekts, angegeben durch einen Vektor $m_a$ im Koordinatensystem des Geräts, mit der Rotationsmatrix des Geräts multipliziert und dann der Translationsvektor hinzugefügt.

$ m_b = R_"ba" m_a + a_b $

Der Translationsvektor $a_b$ in der Gleichung ist entscheidend für die korrekte Platzierung des virtuellen Objekts im globalen Koordinatensystem. Er leitet sich aus dem ursprünglichen Translationsvektor $b_a$ ab, der die Verschiebung des Ursprungs des Koordinatensystems des AR-Geräts relativ zum globalen Koordinatensystem beschreibt.

Um $a_b$ zu bestimmen, verwendet man die negative Transformation des Vektors $b_a$ durch die Rotationsmatrix $R_"ba"$. Dieser Schritt ist notwendig, um die ursprüngliche Verschiebung des AR-Geräteursprungs im globalen Koordinatensystem rückgängig zu machen.

$ a_b = -R_"ba"b_a $

Dadurch wird gewährleistet, dass die Position des virtuellen Objekts korrekt, relativ zum globalen Ursprung und nicht zum verschobenen Ursprung des Geräts, berechnet wird. Diese Transformation ermöglicht die präzise Einbettung der Objektkoordinaten in die reale Welt.

Um eine allgemeine Notation zu verwenden, wird die Position eines Objekts im globalen Koordinatensystem als 6DoF Pose bezeichnet. 6DoF steht für sechs Freiheitsgrade, die die Position und Orientierung eines Objekts im Raum beschreiben. Diese sechs Bewegungen zusammen geben einem System oder einem Objekt die Fähigkeit, seine vollständige Pose im Raum zu steuern und zu ändern.

=== Inertialsensoren
Inertialsensoren wie Beschleunigungsmesser, Gyroskope und Magnetometer werden oft zusätzlich zu visuellen Sensoren in AR-Tracking-Systemen verwendet. Diese Sensoren messen Bewegungen ohne externe Referenzen und sind in einer Inertialmess-Einheit (IMU) kombiniert. Die Sensororientierung wird über Beschleunigungsmesser und Gyroskopdaten relativ zu einem globalen Koordinatensystem, das gegen die Schwerkraft und zum magnetischen Nordpol ausgerichtet ist, bestimmt.