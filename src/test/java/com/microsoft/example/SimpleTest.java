package com.microsoft.example;

import static org.junit.Assert.assertEquals;
import org.junit.Test;

public class SimpleTest {
  @Test
  public void evaluatesExpression() {
    int sum = 1 + 2 + 3;
    assertEquals(6, sum);
  }
}
