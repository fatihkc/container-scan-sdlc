package main

import (
	"net/http"

	"github.com/labstack/echo"
)

func main() {

	e := echo.New()

	e.GET("/health", healthCheck)
	e.Logger.Fatal(e.Start(":8080"))
}

func healthCheck(c echo.Context) error {
	return c.String(http.StatusOK, "Service is healthy!")
}
