# myCompiler
컴파일러 수업 개인 기말 프로젝트로 만든 간단한 컴파일러<br>
기본적인 사칙연산만 수행할 수 있다.<br>
<hr>
<h3>사용법</h3>
1. 연산자 문법
<li> + -> plus</li>
<li> - -> minus</li>
<li> * -> times</li>
<li> / -> divided by</li>
<li> = -> is</li>
<li> ; -> .</li>
<br>
2. 기타 문법
<li>프로그램은 begin으로 시작하여 finish로 끝난다.</li>
<br>
3. 컴파일러 생성하는 법
<li>win flex bison 설치</li>
<li>배치 파일을 활용하여 명령어 실행</li>
&nbsp&nbsp&nbsp&nbsp&nbsp./flex myCompiler<br>
&nbsp&nbsp&nbsp&nbsp&nbsp./bison myCompiler<br><br>
<li>생성된 C 파일 컴파일(경고가 발생하지만 무시)</li>
&nbsp&nbsp&nbsp&nbsp&nbspgcc -o myCompiler.exe myCompiler.c myCompilerlex.c<br><br>
<li>생성된 myCompiler.exe가 바로 컴파일러가 된다.</li>
<br>
4. StackSim (C) Copyright by Jae Sung Lee (jasonlee@cbnu.ac.kr), 2022.<br>
myCompiler.exe로 .cbu 파일을 컴파일하면 myAssembly.asm 파일을 만들어주는데<br>
이 어셈블리 파일에는 가상의 스택 기계 코트가 쓰여져 있다. 이를 실행 시켜주는 프로그램이<br>StackSim이다.<br><br>
이 프로그램과 가상 스택 기계 코드는 교수님이 만든 것으로 저작권은 교수님에게 있다.<br><br>
