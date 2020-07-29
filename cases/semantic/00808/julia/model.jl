#= 
    This code was generated by heta-compiler of v0.5.8
    
=#

module julia 
using SimSolver

### create default constants
constants_ = NamedTuple{(
  
)}(Float64[
  
])

### initialization of ODE variables and Records
function start_(cons)
    #() = cons

    # Heta initialize
    t = 0.0 # initial time
    C = 1.0
    S4 = 0.0 / C
    k = 0.8
    S1 = 1.0 / C
    S2 = 0.5 / C
    S3 = 0.75 / C
    reaction1 = C * k * S1 * S2 * S3
    
    # save results

    return (
        [
            S1 * C,
            S2 * C,
            S3 * C,
            S4 * C,
        ],
        
        [
            C,
            k,
        ]
    )
end

### calculate RHS of ODE
function ode_(du, u, p, t)
    cons = p.constants
    (C,k,) = p.static
    (S1_,S2_,S3_,S4_,) = u 

    # Heta rules
    S4 = S4_ / C
    S1 = S1_ / C
    S2 = S2_ / C
    S3 = S3_ / C
    reaction1 = C * k * S1 * S2 * S3
    
    #p.static .= [C,k,]
    du .= [
      -reaction1,  # dS1_/dt
      -reaction1,  # dS2_/dt
      -reaction1,  # dS3_/dt
      reaction1,  # dS4_/dt
    ]
end

### output function
function make_saving_(outputIds::Vector{Symbol})
    function saving_(u, t, integrator)
        cons = integrator.p.constants
        (C,k,) = integrator.p.static
        (S1_,S2_,S3_,S4_,) = u

        # Heta rules
        S4 = S4_ / C
        S1 = S1_ / C
        S2 = S2_ / C
        S3 = S3_ / C
        reaction1 = C * k * S1 * S2 * S3
        
        # calculate amounts
        C_ = C
        reaction1_ = reaction1
        k_ = k

        d = Base.@locals
        return [d[id] for id in outputIds]
    end
end

### time events

### discrete events


### continous events


### event assignments


### OUTPUT ###

x00808 = Model(
  start_,
  ode_,
  [
  ],
  make_saving_,
  constants_
)

models = (
    x00808 = x00808
)
tasks = ()

export models, tasks

end
