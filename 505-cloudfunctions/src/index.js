/**
 * Responds to any HTTP request.
 *
 * @param {!express:Request} req HTTP request context.
 * @param {!express:Response} res HTTP response context.
 */

exports.helloGET = function helloGET (req, res) {
    res.send(`Hello ${req.body.name || 'ECOM TEAM'}!`);
};
